package com.example.mupdf_android

import com.artifex.mupdf.fitz.ColorSpace
import com.artifex.mupdf.fitz.Document
import com.artifex.mupdf.fitz.Matrix

class MuPdfEngine {

    private val documents = mutableMapOf<Long, Document>()

    private var nextId = 1L

    /**
     * Open PDF document.
     *
     * @return Unique document ID.
     */
    @Synchronized
    fun open(path: String): Long {
        val doc = Document.openDocument(path)

        val id = nextId++

        documents[id] = doc

        return id
    }

    /**
     * Get document page count.
     */
    @Synchronized
    fun getPageCount(documentId: Long): Long {
        val doc = getDocument(documentId)

        return doc.countPages().toLong()
    }

    /**
     * Render a PDF page into PNG bytes.
     */
    @Synchronized
    fun renderPage(
        documentId: Long,
        pageIndex: Long,
        zoom: Double
    ): ByteArray {

        val doc = getDocument(documentId)

        require(zoom.isFinite() && zoom > 0.0) {
            "Invalid zoom value: $zoom"
        }

        require(pageIndex >= 0 && pageIndex < doc.countPages()) {
            "Page index out of range: $pageIndex"
        }

        val page = doc.loadPage(pageIndex.toInt())

        try {
            val matrix = Matrix(zoom.toFloat())

            val pixmap = page.toPixmap(
                matrix,
                ColorSpace.DeviceRGB,
                false,
                true
            )

            try {
                val buffer = pixmap.asPNG()

                try {
                    return buffer.asByteArray()
                } finally {
                    buffer.destroy()
                }

            } finally {
                pixmap.destroy()
            }

        } finally {
            page.destroy()
        }
    }

    /**
     * Close document.
     */
    @Synchronized
    fun close(documentId: Long) {
        val doc = documents.remove(documentId)
            ?: return

        doc.destroy()
    }

    /**
     * Close all opened documents.
     */
    @Synchronized
    fun closeAll() {
        documents.values.forEach { doc ->
            doc.destroy()
        }

        documents.clear()
    }

    private fun getDocument(id: Long): Document {
        return documents[id]
            ?: throw IllegalArgumentException(
                "Document not found: $id"
            )
    }
}