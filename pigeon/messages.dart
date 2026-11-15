import 'package:pigeon/pigeon.dart';

// This file is where you define the interface between Dart code and host
// platform code. After editing this file, run
//   dart run pigeon --input pigeon/messages.dart
// to re-generate all of the output files.
//
// If you add new platforms to your plugin, add the corresponding output
// options in the PigeonOptions below.
//
// To learn more about Pigeon, see https://pub.dev/packages/pigeon.

@ConfigurePigeon(
  PigeonOptions(
    dartPackageName: 'mupdf_android',
    dartOut: 'lib/src/messages.g.dart',
    kotlinOut:
        'android/src/main/kotlin/com/example/mupdf_android/Messages.g.kt',
    kotlinOptions: KotlinOptions(package: 'com.example.mupdf_android'),
  ),
)
@HostApi()
abstract class MupdfAndroidPluginApi {
  /// open
  int open(String path);

  int getPageCount(int documentId);

  Uint8List renderPage(int documentId, int pageIndex, double zoom);

  void close(int documentId);
}
