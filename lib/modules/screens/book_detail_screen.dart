import 'package:flutter/material.dart';
import 'package:library_management_app/modules/models/book.dart';
import 'package:library_management_app/modules/screens/borrowing_screen.dart';
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
                widget.book.thumbnail.isNotEmpty
                    ? Center(
                        child: Image.network(widget.book.thumbnail),
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
                        widget.book.title,
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
                        await Provider.of<BooksProvider>(context, listen: false)
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
                      icon:
                          const Icon(Icons.calendar_today, color: Colors.amber),
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
    );
  }
}
