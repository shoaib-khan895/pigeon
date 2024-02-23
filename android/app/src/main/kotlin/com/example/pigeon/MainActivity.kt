package com.example.pigeon

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.Pigeon
import java.util.*

class MainActivity : FlutterActivity() {
    private class MyBookApi : Pigeon.BookApi {
        override fun search(keyword: String): MutableList<Pigeon.Book> {
            val random = Random()
            val book = Pigeon.Book()
            book.urlImage = "https://picsum.photos/200/300?random=" + random.nextInt()
            book.title = java.lang.String.format("Life %s", keyword)
            return Collections.singletonList(book)
        }
    }
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Pigeon.BookApi.setUp(flutterEngine.dartExecutor.binaryMessenger, MyBookApi())
    }
}