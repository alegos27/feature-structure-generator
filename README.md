# Feature Structure Generator Tool
This tool generates the structure of a feature in a feature based Flutter project. It creates folders and files for the feature following the structure of a project like [project-sample-tree.txt].

## Install
Add  the dependency to your `pubspec.yaml` file:
```yaml
dev_dependencies:
  feature_structure_generator:
    git:
      url: git://github.com/alegos27/feature_structure_generator
```

## Usage
```sh
dart run feature_structure_generator generate feature_name
```