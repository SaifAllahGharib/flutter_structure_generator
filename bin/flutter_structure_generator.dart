import 'dart:io';

void main() {
  final baseDir = Directory('lib');

  print('📁 Creating core structure...');
  _createDirs([
    'core/di',
    'core/constants',
    'core/error',
    'core/utils',
    'core/services',
    'routing',
  ], baseDir);

  print('🧱 Creating features...');
  _createDirs(['features/'], baseDir);

  print('📝 Creating routing.dart files...');
  File('${baseDir.path}/routing/app_router.dart').createSync(recursive: true);

  print('✅ Structure created successfully!');
}

void _createDirs(List<String> paths, Directory base) {
  for (final path in paths) {
    final dir = Directory('${base.path}/$path');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('📂 Created: ${dir.path}');
    }
  }
}
