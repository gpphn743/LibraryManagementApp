import 'package:flutter/material.dart';
import 'package:library_management_app/modules/service/books_provider.dart';
import 'package:library_management_app/modules/themes/app_color.dart';
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(20),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.grey.withOpacity(0.5),
                        //       spreadRadius: 2,
                        //       blurRadius: 5,
                        //       offset: const Offset(0, 3))
                        // ],
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
                  );
                },
              ),
      ),
    );
  }
}
