package com.example.mupdf_android

import io.flutter.embedding.engine.plugins.FlutterPlugin

/**
 * MupdfAndroidPlugin
 */
class MupdfAndroidPlugin :
    FlutterPlugin,
    MupdfAndroidPluginApi {

    private val engine = MuPdfEngine()

    override fun onAttachedToEngine(
        flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
    ) {
        MupdfAndroidPluginApi.setUp(
            flutterPluginBinding.binaryMessenger,
            this
        )
    }

    override fun onDetachedFromEngine(
        binding: FlutterPlugin.FlutterPluginBinding
    ) {
        MupdfAndroidPluginApi.setUp(
            binding.binaryMessenger,
            null
        )

        engine.closeAll()
    }

    override fun open(path: String): Long {
        return engine.open(path)
    }

    override fun getPageCount(documentId: Long): Long {
        return engine.getPageCount(documentId)
    }

    override fun renderPage(
        documentId: Long,
        pageIndex: Long,
        zoom: Double
    ): ByteArray {
        return engine.renderPage(
            documentId,
            pageIndex,
            zoom
        )
    }

    override fun close(documentId: Long) {
        engine.close(documentId)
    }
}