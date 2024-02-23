import 'package:flutter/material.dart';

import 'messages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Book> books = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Pigeon'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SizedBox(
                        height: 500,
                        child: Ink.image(
                          image: NetworkImage(book.urlImage!),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: () {
                              // Add any onTap functionality here
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                book.title!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          onPressed: () => getBook(),
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          onPressed: () => reset(),
          child: const Icon(Icons.refresh),
        ),
      ],
    );
  }

  Future getBook() async {
    final number = this.books.length + 1;
    final List<Book?> books = await BookApi().search('Book $number');
    final newBooks = List<Book>.from(books);
    setState(() => this.books..addAll(newBooks));
  }

  void reset() {
    setState(() {
      books.clear();
    });
  }
}
