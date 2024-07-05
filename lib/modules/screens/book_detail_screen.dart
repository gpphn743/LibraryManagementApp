import 'package:flutter/material.dart';
import 'package:library_management_app/modules/models/book.dart';
import 'package:library_management_app/modules/screens/borrowing_screen.dart';
import 'package:library_management_app/modules/service/books_provider.dart';
import 'package:library_management_app/modules/themes/app_color.dart';
import 'package:library_management_app/modules/themes/spacing.dart';
import 'package:provider/provider.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    //final booksProvider = Provider.of<BooksProvider>(context);

    // IconData icon;
    // if (condition) {

    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                book.thumbnail.isNotEmpty
                    ? Center(
                        child: Image.network(book.thumbnail),
                      )
                    : const Center(
                        child:
                            // Container(
                            //   color: Colors.blueGrey[300],
                            //   height: 200,
                            //   width: 200,
                            //   child: const Icon(
                            //     Icons.book,
                            //     size: 100,
                            //     color: Colors.white,
                            //   ),
                            // ),
                            SizedBox(
                          height: 200,
                          width: 200,
                          child: Image(
                              image: AssetImage("assets/images/megamindd.png")),
                        ),
                      ),
                Spacing.v10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        book.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.amber,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          // booksProvider.addToBorrowedBooks(book);
                          // Navigator.pop(context);
                          await Provider.of<BooksProvider>(context,
                                  listen: false)
                              .addToBorrowedBooks(book);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('${book.title} added to Borrowing')),
                          );
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.amber,
                        ))
                  ],
                ),
                Spacing.v10,
                Center(
                  child: Text(
                    book.authors,
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Spacing.v10,
                Text(
                  book.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
                // ElevatedButton.icon(
                //   onPressed: () {
                //     booksProvider.addToBorrowedBooks(book);
                //     Navigator.pop(context);
                //   },
                //   icon: const Icon(Icons.add_circle_outline),
                //   label: const Text('Add to Borrowing List'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
