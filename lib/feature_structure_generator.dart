import 'dart:io';
import 'dart:isolate';

void generate({
  required String featureName,
  String baseStateClassName = 'BaseState',
  String baseStateClassPath = 'common/data/models/states/_base_state.dart',
  String baseNotifierClassName = 'BaseNotifier',
  String baseNotifierClassPath = 'common/data/providers/_base_notifier.dart',
  String notifierStatusEnumName = 'NotifierStatus',
  String notifierStatusEnumPath = 'common/data/provider/_notifier_status.dart',
}) async {
  final templatesUri = await Isolate.resolvePackageUri(Uri.parse('package:feature_structure_generator/templates/'));
  if(templatesUri == null) {
    print('Error resolving templates package URI');
    return;
  }

  final featureDir = 'lib/features/$featureName';
  final testFeatureDir = 'test/features/$featureName';

  // Directories to be created for a new feature
  final dirs = <String>[
    'data/gql',
    'data/models',
    'data/models/states',
    'data/providers',
    'data/repositories',
    'views/screens',
    'views/widgets',
  ];

  final templates = <String, List<String>>{
    'data/gql': ['gql_query_template.dart', 'gql_mutation_template.dart'],
    'data/models': ['template_model.dart'],
    'data/models/states': ['template_state.dart'],
    'data/providers': ['template_provider.dart'],
    'data/repositories': ['template_repository.dart'],
    'views/screens': ['template_screen.dart'],
    'views/widgets': ['template_widget.dart'],
  };

  // Create the base feature and test feature directories
  Directory(featureDir).createSync(recursive: true);
  Directory(testFeatureDir).createSync(recursive: true);

  // Create subdirectories and copy template files
  for (final dir in dirs) {
    final directory = Directory('$featureDir/$dir')..createSync(recursive: true);

    // Copy template files to the newly created directory
    final fileNames = templates[dir];
    if (fileNames != null) {
      for (final fileName in fileNames) {
        final templateFileUri = templatesUri.replace(pathSegments: [...dir.split('/'), fileName]);
        final templateFile = File.fromUri(templateFileUri);
        final newFile = File('${directory.path}/${featureName}_$fileName');

        // Check if template file exists before copying
        if (templateFile.existsSync()) {
          templateFile.copySync(newFile.path);
        } else {
          print('Template file $fileName does not exist in $templateFileUri');
          return;
        }
      }
    }
  }

  // Copy test template file
  final testFileName = '${featureName}_test.dart';
  final templateTestFileUri = templatesUri.replace(pathSegments: ['test', 'test_template.dart']);
  final testTemplateFile = File.fromUri(templateTestFileUri);
  final newTestFile = File('$testFeatureDir/$testFileName');
  if (testTemplateFile.existsSync()) {
    testTemplateFile.copySync(newTestFile.path);
  } else {
    print('Test template file $testFileName does not exist in $templateTestFileUri');
    return;
  }

  print('Feature structure for "$featureName" created successfully with templates.');

  // Define replacements
  final replacements = <String, String>{
    'template_base_state.dart': baseStateClassPath,
    'template_notifier_status.dart': notifierStatusEnumPath,
    'template_base_notifier.dart': baseNotifierClassPath,
    '../models/states/template_state.dart': '../models/states/${featureName}_template_state.dart',
    '../repositories/template_repository.dart': '../repositories/${featureName}_template_repository.dart',
    'template_state.freezed.dart': '${featureName}_template_state.freezed.dart',
    'template_model.freezed.dart': '${featureName}_template_model.freezed.dart',
    'template_model.g.dart': '${featureName}_template_model.g.dart',
    'BaseState': baseStateClassName,
    'BaseNotifier': baseNotifierClassName,
    'NotifierStatus': notifierStatusEnumName,
  };

  // Apply replacements to the specific files
  final stateFilePath = '$featureDir/data/models/states/${featureName}_template_state.dart';
  final modelFilePath = '$featureDir/data/models/${featureName}_template_model.dart';
  final providerFilePath = '$featureDir/data/providers/${featureName}_template_provider.dart';

  await _replaceInFile(stateFilePath, replacements);
  await _replaceInFile(modelFilePath, replacements);
  await _replaceInFile(providerFilePath, replacements);

  print('Replacements applied successfully.');

  // Run build_runner to generate files
  await _runBuildRunner();

  // Apply Dart fixes
  await _applyDartFixes(featureDir);
}

Future<void> _replaceInFile(String filePath, Map<String, String> replacements) async {
  final file = File(filePath);
  var content = await file.readAsString();

  replacements.forEach((original, replacement) {
    content = content.replaceAll(original, replacement);
  });

  await file.writeAsString(content);
}

Future<void> _runBuildRunner() async {
  final result = await Process.run('dart', ['run', 'build_runner', 'build', '--delete-conflicting-outputs']);
  if (result.exitCode != 0) {
    print('Error running build_runner: ${result.stderr}');
  } else {
    print('build_runner completed successfully');
  }
}

Future<void> _applyDartFixes(String featureDir) async {
  final result = await Process.run('dart', ['fix', '--apply'], workingDirectory: featureDir);
  if (result.exitCode != 0) {
    print('Error applying Dart fixes: ${result.stderr}');
  } else {
    print('Dart fixes applied successfully.');
  }
}
