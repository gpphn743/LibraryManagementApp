import 'package:flutter/material.dart';
import 'package:library_management_app/modules/route/route_name.dart';

class BorrowingScreen extends StatelessWidget {
  const BorrowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // appBar: AppBar(
        //   title: const Text('BorrowingScreen'),
        //   leading: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.arrow_back),
        //   ),
        //   actions: <Widget>[
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.settings_outlined),
        //       tooltip: 'Settings',
        //     )
        //   ],
        // ),
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
