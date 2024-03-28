import 'package:args/args.dart';
import 'package:feature_structure_generator/feature_structure_generator.dart' as feature_structure_generator;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    printUsage();
    return;
  }

  final parser = ArgParser()
    ..addOption('baseStateClassName', defaultsTo: 'BaseState')
    ..addOption('baseStateClassPath', defaultsTo: '../../../../../../common/data/models/states/_base_state.dart')
    ..addOption('baseNotifierClassName', defaultsTo: 'BaseNotifier')
    ..addOption('baseNotifierClassPath', defaultsTo: '../../../../../../common/data/providers/_base_notifier.dart')
    ..addOption('notifierStatusEnumName', defaultsTo: 'NotifierStatus')
    ..addOption('notifierStatusEnumPath', defaultsTo: '../../../../../../common/data/provider/_notifier_status.dart');

  var argResults = parser.parse(arguments);

  switch (arguments[0]) {
    case 'generate':
      if (arguments.length < 2) {
        print('Error: No feature name provided.');
        printUsage();
        return;
      }
      final featureName = arguments[1];
      feature_structure_generator.generate(
        featureName: featureName,
        baseStateClassName: argResults['baseStateClassName'],
        baseStateClassPath: argResults['baseStateClassPath'],
        baseNotifierClassName: argResults['baseNotifierClassName'],
        baseNotifierClassPath: argResults['baseNotifierClassPath'],
        notifierStatusEnumName: argResults['notifierStatusEnumName'],
        notifierStatusEnumPath: argResults['notifierStatusEnumPath'],
      );
      break;
    default:
      print('Unknown command: ${arguments[0]}');
      printUsage();
      break;
  }
}

void printUsage() {
  print('Usage: feature_structure_generator generate <feature_name>');
  print('Options:');
  print('  --baseStateClassName <base_state_class_name>');
  print('  --baseStateClassPath <base_state_class_path>');
  print('  --baseNotifierClassName <base_notifier_class_name>');
  print('  --baseNotifierClassPath <base_notifier_class_path>');
  print('  --notifierStatusEnumName <notifier_status_enum_name>');
  print('  --notifierStatusEnumPath <notifier_status_enum_path>');
}
