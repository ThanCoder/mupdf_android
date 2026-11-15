import 'dart:typed_data';

import 'package:mupdf_android/src/messages.g.dart';

class MuPdfDocument {
  MuPdfDocument(this.id, this._api);

  final int id;
  final MupdfAndroidPluginApi _api;

  /// get page count
  Future<int> get pageCount => _api.getPageCount(id);

  Future<Uint8List> renderPage(int pageIndex, {double zoom = 1.5}) =>
      _api.renderPage(id, pageIndex, zoom);

  ///close document
  Future<void> close() => _api.close(id);
}
