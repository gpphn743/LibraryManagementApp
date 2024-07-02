// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:library_management_app/modules/route/route_name.dart';
// import 'package:library_management_app/modules/themes/app_color.dart';

// class BookListScreen extends StatelessWidget {
//   const BookListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // leading: IconButton(
//         //   onPressed: () {
//         //     //provide valid action to make icon appear!
//         //   },
//         //   icon: const Icon(Icons.arrow_back),
//         // ),
//         actions: [
//           Expanded(
//             child: Container(
//               margin: const EdgeInsets.all(8.0),
//               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//               decoration: BoxDecoration(
//                 color: AppColors.mainColor,
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               child: const Center(
//                 child: Icon(
//                   Icons.search_rounded,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         children: List.generate(99, (index) {
//           final itemColor = getRandomColor();
//           return Center(
//             child: Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: itemColor,
//               ),
//               width: 110,
//               height: 110,
//               child: Text(
//                 'Item $index',
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

// Color getRandomColor() {
//   final random = Random();
//   return Color.fromARGB(
//     255,
//     random.nextInt(256),
//     random.nextInt(256),
//     random.nextInt(256),
//   );
// }

import 'package:flutter/material.dart';
import 'package:library_management_app/modules/screens/book_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:library_management_app/modules/service/books_provider.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context);
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search for books',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    booksProvider.fetchBooks(_controller.text);
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            booksProvider.isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                      itemCount: booksProvider.books.length,
                      itemBuilder: (context, index) {
                        final book = booksProvider.books[index];
                        return ListTile(
                          leading: book.thumbnail.isNotEmpty
                              ? Image.network(book.thumbnail)
                              : null,
                          title: Text(book.title),
                          subtitle: Text(book.authors),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BookDetailScreen(book: book)),
                            );
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
