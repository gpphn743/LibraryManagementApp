import 'package:flutter/material.dart';
import 'package:library_management_app/modules/screens/book_detail_screen.dart';
import 'package:library_management_app/modules/screens/borrowing_screen.dart';
import 'package:library_management_app/modules/screens/bucketlist_screen.dart';
import 'package:library_management_app/modules/screens/page_not_found.dart';
import 'package:library_management_app/modules/screens/trending_screen.dart';
import 'package:library_management_app/modules/service/books_provider.dart';
import 'package:library_management_app/modules/models/book.dart';
import 'package:library_management_app/modules/themes/app_color.dart';
import 'package:library_management_app/modules/themes/spacing.dart';
import 'package:library_management_app/modules/widgets/control.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showTrendingScreen = false;

  void _toggleTrendingScreen() {
    setState(() {
      _showTrendingScreen = !_showTrendingScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.contentColor,
      body: SafeArea(
        child: _showTrendingScreen
            ? const TrendingScreen()
            : Consumer<BooksProvider>(
                builder: (context, booksProvider, child) {
                  if (booksProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return _buildContent(context);
                  }
                },
              ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: false);

    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30)),
                  child:
                      // const Icon(
                      //   Icons.arrow_back_rounded,
                      //   color: Colors.black,
                      // ),
                      ClipOval(
                    child: Image.asset(
                      'assets/images/shoes.jpg',
                    ),
                  ),
                ),
                onTap: () {},
              ),
              GestureDetector(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome,",
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Eddie Wood.",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 38,
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
            'Bucket List',
            Icons.card_giftcard,
            booksProvider.bucketListBooks,
          ),
          _buildSection(
            context,
            'On Borrowing',
            Icons.menu_book,
            booksProvider.borrowedBooks,
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Spacing.h4,
                Icon(
                  icon,
                  color: Colors.amber,
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                // if (title == 'Bucket List') {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const BucketlistScreen(),
                //     ),
                //   );
                // }

                switch (title) {
                  case 'Trending':
                    _toggleTrendingScreen();
                    break;
                  // case 'On Borrowing':
                  //   break;
                  case 'Bucket List':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BucketlistScreen(),
                      ),
                    );
                    break;
                  default:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageNotFound(),
                      ),
                    );
                    break;
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
              return GestureDetector(
                child: Container(
                  width: 160,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200,
                  ),
                  margin: const EdgeInsets.only(right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      book.thumbnail.isNotEmpty
                          ? Image.network(
                              book.thumbnail,
                              fit: BoxFit.contain,
                              width: 140,
                              height: 140,
                            )
                          : const Image(
                              image: AssetImage('assets/images/huh.jpg'),
                              fit: BoxFit.contain,
                              width: 140,
                              height: 140,
                            ),
                      Spacing.v20,
                      Flexible(
                        child: Text(
                          book.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 14.0,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookDetailScreen(book: book)),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
