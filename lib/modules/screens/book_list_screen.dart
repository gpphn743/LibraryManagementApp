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
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management_app/modules/screens/book_detail_screen.dart';
import 'package:library_management_app/modules/themes/app_color.dart';
import 'package:library_management_app/modules/themes/spacing.dart';
import 'package:provider/provider.dart';
import 'package:library_management_app/modules/service/books_provider.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  void _pushtoHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context);
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.contentColor,
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white, // Start fully opaque
                  Colors.transparent, // End fully transparent
                ],
                stops: [0.7, 1.0], // Adjust the stops to control the fade area
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn, // Blend mode to apply the shader
            child: Image.asset(
              'assets/images/library.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(5.0),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white70,
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
                      onTap: () {
                        _pushtoHomeScreen(context);
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacing.v10,
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'bookshelf.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
                      shadows: const [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black,
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacing.v10,
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          controller: controller,
                          decoration: InputDecoration(
                            hintText: 'Search for books',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              color: Colors.black54,
                              onPressed: () {
                                booksProvider.fetchBooks(controller.text);
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 1.5,
                        color: Colors.black54,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.tune,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                booksProvider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: booksProvider.books.length,
                          itemBuilder: (context, index) {
                            final book = booksProvider.books[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // border: Border.all(color: Colors.amber),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                  leading: book.thumbnail.isNotEmpty
                                      ? Image.network(book.thumbnail)
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: const Image(
                                            image: AssetImage(
                                                "assets/images/huh.jpg"),
                                          ),
                                        ),
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
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
