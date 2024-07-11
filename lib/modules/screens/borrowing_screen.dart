import 'package:flutter/material.dart';
import 'package:library_management_app/modules/models/book.dart';
import 'package:library_management_app/modules/service/books_provider.dart';
import 'package:library_management_app/modules/themes/app_color.dart';
import 'package:library_management_app/modules/themes/spacing.dart';
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

  void _showBookDetailsBottomSheet(BuildContext context, Book book) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Spacing.v10,
              Text(
                book.authors,
                style:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              Spacing.v10,
              Text(
                'Borrow Date: ${book.borrowDate != null ? book.borrowDate!.toLocal().toString().split(' ')[0] : 'N/A'}',
                style: const TextStyle(fontSize: 16),
              ),
              Spacing.v10,
              Text(
                'Return Date: ${book.returnDate != null ? book.returnDate!.toLocal().toString().split(' ')[0] : 'N/A'}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        _showBookDetailsBottomSheet(context, book);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.mainColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          leading: book.thumbnail.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(book.thumbnail),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: const Image(
                                    image: AssetImage("assets/images/huh.jpg"),
                                  ),
                                ),
                          title: Text(book.title),
                          subtitle: Text(book.authors),
                          trailing: IconButton(
                            onPressed: () async {
                              await booksProvider.deleteBorrowedBooks(book.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      '${book.title} removed from Borrowing'),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
