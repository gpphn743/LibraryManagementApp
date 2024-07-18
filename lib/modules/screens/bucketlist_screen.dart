import 'package:flutter/material.dart';
import 'package:library_management_app/modules/service/books_provider.dart';
import 'package:provider/provider.dart';

class BucketlistScreen extends StatelessWidget {
  const BucketlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Bucket List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: booksProvider.bucketListBooks.isEmpty
            ? const Center(
                child: Text('No Favorite Books Yet!'),
              )
            : ListView.builder(
                itemCount: booksProvider.bucketListBooks.length,
                itemBuilder: (context, index) {
                  final book = booksProvider.bucketListBooks[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: book.thumbnail.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(book.thumbnail),
                            )
                          : const Image(
                              image: AssetImage("assets/images/huh.jpg"),
                            ),
                      title: Text(book.title),
                      subtitle: Text(book.authors),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
