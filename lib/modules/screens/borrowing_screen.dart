import 'package:flutter/material.dart';
import 'package:library_management_app/modules/service/books_provider.dart';
import 'package:provider/provider.dart';

class BorrowingScreen extends StatefulWidget {
  const BorrowingScreen({super.key});

  @override
  State<BorrowingScreen> createState() => _BorrowingScreenState();
}

class _BorrowingScreenState extends State<BorrowingScreen> {
  @override
  void initState() {
    super.initState();
    fetchBorrowedBooks();
  }

  Future<void> fetchBorrowedBooks() async {
    await Provider.of<BooksProvider>(context, listen: false)
        .fetchBorrowedBooks();
  }

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: booksProvider.borrowedBooks.isEmpty
            ? const Center(
                child: Text('No Borrowed Books Yet!'),
              )
            : ListView.builder(
                itemCount: booksProvider.borrowedBooks.length,
                itemBuilder: (context, index) {
                  final book = booksProvider.borrowedBooks[index];
                  return ListTile(
                    leading: book.thumbnail.isNotEmpty
                        ? Image.network(book.thumbnail)
                        : null,
                    title: Text(book.title),
                    subtitle: Text(book.authors),
                  );
                },
              ),
      ),
    );
  }
}
