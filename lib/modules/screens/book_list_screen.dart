import 'dart:math';

import 'package:flutter/material.dart';
import 'package:library_management_app/modules/route/route_name.dart';
import 'package:library_management_app/modules/themes/app_color.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     //provide valid action to make icon appear!
        //   },
        //   icon: const Icon(Icons.arrow_back),
        // ),
        actions: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Center(
                child: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(99, (index) {
          final itemColor = getRandomColor();
          return Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: itemColor,
              ),
              width: 110,
              height: 110,
              child: Text(
                'Item $index',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          );
        }),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (index) {
      //     switch (index) {
      //       case 0:
      //         Navigator.pushNamed(context, RouteName.home);
      //         break;
      //       case 1:
      //         Navigator.pushNamed(context, RouteName.booklist);
      //         break;
      //       case 2:
      //         Navigator.pushNamed(context, RouteName.borrowing);
      //         break;
      //       case 3:
      //         Navigator.pushNamed(context, RouteName.account);
      //         break;
      //       default:
      //     }
      //   },
      //   type: BottomNavigationBarType.fixed,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.list),
      //       label: 'Book List',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.menu_book),
      //       label: 'Borrowing',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_box),
      //       label: 'Account',
      //     ),
      //   ],
      // ),
    );
  }
}

Color getRandomColor() {
  final random = Random();
  return Color.fromARGB(
    255, 
    random.nextInt(256), 
    random.nextInt(256), 
    random.nextInt(256), 
  );
}
