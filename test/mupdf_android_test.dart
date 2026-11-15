// import 'package:flutter_test/flutter_test.dart';
// import 'package:mupdf_android/mupdf_android.dart';
// import 'package:mupdf_android/mupdf_android_pigeon.dart';
// import 'package:mupdf_android/mupdf_android_platform_interface.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockMupdfAndroidPlatform
//     with MockPlatformInterfaceMixin
//     implements MupdfAndroidPlatform {
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final initialPlatform = MupdfAndroidPlatform.instance;

//   test('PigeonMupdfAndroid is the default instance', () {
//     expect(initialPlatform, isInstanceOf<PigeonMupdfAndroid>());
//   });

//   test('getPlatformVersion', () async {
//     MupdfAndroid mupdfAndroidPlugin = MupdfAndroid();
//     MockMupdfAndroidPlatform fakePlatform = MockMupdfAndroidPlatform();
//     MupdfAndroidPlatform.instance = fakePlatform;

//     expect(await mupdfAndroidPlugin.getPlatformVersion(), '42');
//   });
// }
