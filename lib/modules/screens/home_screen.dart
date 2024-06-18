// import 'package:flutter/material.dart';
// import 'package:library_management_app/modules/route/route_name.dart';
// import 'package:library_management_app/modules/themes/app_color.dart';
// import 'package:library_management_app/modules/themes/spacing.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: Container(
//         alignment: Alignment.topLeft,
//         margin: const EdgeInsets.all(10),
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           children: <Widget>[
//             const Text(
//               "Welcome, username!",
//               style: TextStyle(
//                   color: AppColors.mainColor,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Row(
//                   children: [
//                     Text(
//                       'Trending',
//                       style: TextStyle(
//                           color: AppColors.mainColor,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Icon(
//                       Icons.star,
//                       color: Colors.amber,
//                     ),
//                   ],
//                 ),
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.double_arrow_rounded,
//                       color: AppColors.mainColor,
//                     )),
//               ],
//             ),
//             Spacing.v10,
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 10),
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: <Widget>[
//                   Container(
//                     width: 160,
//                     color: Colors.red,
//                   ),
//                   Container(
//                     width: 160,
//                     color: Colors.blue,
//                   ),
//                   Container(
//                     width: 160,
//                     color: Colors.green,
//                   ),
//                   Container(
//                     width: 160,
//                     color: Colors.yellow,
//                   ),
//                   Container(
//                     width: 160,
//                     color: Colors.orange,
//                   ),
//                 ],
//               ),
//             ),
//             Spacing.v10,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Row(
//                   children: [
//                     Text(
//                       'Bucket List',
//                       style: TextStyle(
//                           color: AppColors.mainColor,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Spacing.h4,
//                     Icon(
//                       Icons.card_giftcard,
//                       color: Colors.amber,
//                     ),
//                   ],
//                 ),
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.double_arrow_rounded,
//                       color: AppColors.mainColor,
//                     )),
//               ],
//             ),
//             Spacing.v10,
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 10),
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: <Widget>[
//                   Container(
//                     width: 160,
//                     color: Colors.red,
//                   ),
//                   Container(
//                     width: 160,
//                     color: Colors.blue,
//                   ),
//                   Container(
//                     width: 160,
//                     color: Colors.green,
//                   ),
//                   Container(
//                     width: 160,
//                     color: Colors.yellow,
//                   ),
//                   Container(
//                     width: 160,
//                     color: Colors.orange,
//                   ),
//                 ],
//               ),
//             ),
//             Spacing.v10,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Row(
//                   children: [
//                     Text(
//                       'On Borrowing',
//                       style: TextStyle(
//                           color: AppColors.mainColor,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Spacing.h4,
//                     Icon(
//                       Icons.menu_book,
//                       color: Colors.amber,
//                     ),
//                   ],
//                 ),
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.double_arrow_rounded,
//                       color: AppColors.mainColor,
//                     )),
//               ],
//             ),
//             Spacing.v10,
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 10),
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: <Widget>[
//                   Container(
//                     width: 160,
//                     color: Colors.red,
//                   ),
//                   Container(
//                     width: 160,
//                     color: Colors.blue,
//                   ),
//                   Container(
//                     width: 160,
//                     color: Colors.green,
//                   ),
//                   Container(
//                     width: 160,
//                     color: Colors.yellow,
//                   ),
//                   Container(
//                     width: 160,
//                     color: Colors.orange,
//                   ),
//                 ],
//               ),
//             ),
//             Spacing.v10,
//           ],
//         ),
//       ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   onTap: (index) {
//       //     switch (index) {
//       //       case 0:
//       //         Navigator.pushNamed(context, RouteName.home);
//       //         break;
//       //       case 1:
//       //         Navigator.pushNamed(context, RouteName.booklist);
//       //         break;
//       //       case 2:
//       //         Navigator.pushNamed(context, RouteName.borrowing);
//       //         break;
//       //       case 3:
//       //         Navigator.pushNamed(context, RouteName.account);
//       //         break;
//       //       default:
//       //     }
//       //   },
//       //   type: BottomNavigationBarType.fixed,
//       //   items: const <BottomNavigationBarItem>[
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.home),
//       //       label: 'Home',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.list),
//       //       label: 'Book List',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.menu_book),
//       //       label: 'Borrowing',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.account_box),
//       //       label: 'Account',
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';
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
          const Text(
            "Welcome, username!",
            style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 24,
                fontWeight: FontWeight.bold),
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
            booksProvider.onBorrowingBooks,
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  icon,
                  color: Colors.amber,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
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
                width: 160,
                margin: const EdgeInsets.only(right: 10),
                child: book.thumbnail.isNotEmpty
                    ? Image.network(book.thumbnail)
                    : Container(color: Colors.grey),
              );
            },
          ),
        ),
      ],
    );
  }
}
