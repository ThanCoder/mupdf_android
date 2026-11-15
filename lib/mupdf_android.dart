import 'package:mupdf_android/mupdf_document.dart';
import 'package:mupdf_android/src/messages.g.dart';

class MupdfAndroid {
  static final MupdfAndroid instance = MupdfAndroid._();
  MupdfAndroid._();
  factory MupdfAndroid() => instance;

  final _pkg = MupdfAndroidPluginApi();

  /// open document
  Future<MuPdfDocument> open(String path) async {
    final id = await _pkg.open(path);
    return .new(id, _pkg);
  }
}
