// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mupdf_android/mupdf_android_pigeon.dart';
// import 'package:mupdf_android/src/messages.g.dart';

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();

//   test('getPlatformVersion', () async {
//     final api = FakeMupdfAndroidPluginApi(platformVersion: '42');
//     final plugin = PigeonMupdfAndroid(api: api);

//     expect(await plugin.getPlatformVersion(), '42');
//   });
// }

// /// Fake implementation of the Pigeon API that provides a pre-set response.
// class FakeMupdfAndroidPluginApi implements MupdfAndroidPluginApi {
//   FakeMupdfAndroidPluginApi({required this.platformVersion});

//   final String platformVersion;

//   @override
//   Future<String> getPlatformVersion() async {
//     return platformVersion;
//   }

//   @override
//   // ignore: non_constant_identifier_names
//   BinaryMessenger? get pigeonVar_binaryMessenger => null;

//   @override
//   // ignore: non_constant_identifier_names
//   String get pigeonVar_messageChannelSuffix => '';

//   @override
//   Future<int> getSdkInt() {
//     // TODO: implement getSdkInt
//     throw UnimplementedError();
//   }
// }
