import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:library_management_app/modules/models/book.dart';
import 'package:library_management_app/modules/service/books_provider.dart';
import 'package:library_management_app/modules/themes/app_color.dart';
import 'package:library_management_app/modules/themes/spacing.dart';
import 'package:provider/provider.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;

  const BookDetailScreen({super.key, required this.book});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  DateTime? _selectedReturnDate;

  Future<void> _selectReturnDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)), //default
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedReturnDate) {
      setState(() {
        _selectedReturnDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: false);

    // IconData icon;
    // if (condition) {

    // }
    return Scaffold(
      backgroundColor: AppColors.contentColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          height: 55,
          width: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.lightBlueAccent,
          ),
          alignment: Alignment.center,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '"Book" this!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacing.h10,
              Icon(
                Icons.add_circle_outline_rounded,
                color: Colors.white,
                size: 28,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              color: AppColors.mainColor,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Icons.favorite_border_rounded,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ),
                            Spacing.h10,
                            GestureDetector(
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacing.v20,
                  widget.book.thumbnail.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(widget.book.thumbnail))
                      : Center(
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
                            height: 220,
                            width: 256,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/images/megamindd.png'),
                            ),
                          ),
                        ),
                  Spacing.v20,
                ],
              ),
            ),
            Spacing.v10,
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          widget.book.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            booksProvider.toggleFavoriteStatus(widget.book);
                          });
                        },
                        icon: Icon(
                          widget.book.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.amber,
                        ),
                        tooltip: 'Add to Bucket List',
                      ),
                      IconButton(
                        onPressed: () async {
                          if (_selectedReturnDate == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select a return date'),
                              ),
                            );
                            return;
                          }
                          // booksProvider.addToBorrowedBooks(book);
                          // Navigator.pop(context);
                          await Provider.of<BooksProvider>(context,
                                  listen: false)
                              .addToBorrowedBooks(
                                  widget.book, _selectedReturnDate!);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    '${widget.book.title} added to Borrowing')),
                          );
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.amber,
                        ),
                        tooltip: 'Borrow now!',
                      )
                    ],
                  ),
                  Spacing.v10,
                  Center(
                    child: Text(
                      widget.book.authors,
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Row(
                    //read again this one
                    children: [
                      const Text(
                        'Return Date: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        _selectedReturnDate == null
                            ? 'Select a date'
                            : _selectedReturnDate!
                                .toLocal()
                                .toString()
                                .split(' ')[0],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calendar_today,
                            color: Colors.amber),
                        onPressed: () => _selectReturnDate(context),
                      ),
                    ],
                  ),
                  Spacing.v10,
                  Text(
                    widget.book.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
