import 'package:flutter/material.dart';
import 'package:library_management_app/modules/screens/bucketlist_screen.dart';
import 'package:library_management_app/modules/service/books_provider.dart';
import 'package:library_management_app/modules/models/book.dart';
import 'package:library_management_app/modules/themes/app_color.dart';
import 'package:library_management_app/modules/themes/spacing.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BooksProvider>(
        builder: (context, booksProvider, child) {
          if (booksProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return _buildContent(context);
          }
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: false);

    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.all(10),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome,",
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Eddie Wood.",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          
          _buildSection(
            context,
            'Trending',
            Icons.star,
            booksProvider.trendingBooks,
          ),
          _buildSection(
            context,
            'On Borrowing',
            Icons.menu_book,
            booksProvider.borrowedBooks,
          ),
          _buildSection(
            context,
            'Bucket List',
            Icons.card_giftcard,
            booksProvider.bucketListBooks,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, String title, IconData icon, List<Book> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  icon,
                  color: Colors.amber,
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                if (title == 'Bucket List') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BucketlistScreen(),
                    ),
                  );
                }
              },
              icon: const Icon(
                Icons.double_arrow_rounded,
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
        Spacing.v10,
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return Container(
                width: 130,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.only(right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: book.thumbnail.isNotEmpty
                      ? Image.network(
                          book.thumbnail,
                          fit: BoxFit.cover,
                        )
                      // : Container(
                      //   color: Colors.grey,
                      // ),
                      : const Image(
                          image: AssetImage("assets/images/huh.jpg"),
                          fit: BoxFit.cover,
                        ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
