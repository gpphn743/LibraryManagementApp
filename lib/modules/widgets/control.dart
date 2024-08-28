import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_management_app/modules/screens/account_screen.dart';
import 'package:library_management_app/modules/screens/book_list_screen.dart';
import 'package:library_management_app/modules/screens/borrowing_screen.dart';
import 'package:library_management_app/modules/screens/home_screen.dart';
import 'package:library_management_app/modules/themes/app_color.dart';

class Control extends StatefulWidget {
  const Control({super.key});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const BookListScreen(),
    const BorrowingScreen(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        // appBar: AppBar(
        //   leading: GestureDetector(
        //     child: Container(
        //       margin: const EdgeInsets.all(5),
        //       decoration: const BoxDecoration(
        //           color: AppColors.mainColor,
        //           borderRadius: BorderRadius.all(Radius.circular(15))),
        //       child: const Icon(
        //         Icons.arrow_back_rounded,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        //   actions: <Widget>[
        //     IconButton(
        //       onPressed: _signOut,
        //       icon: const Icon(Icons.logout),
        //       tooltip: 'Sign Out',
        //     )
        //   ],
        // ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          useLegacyColorScheme: false,
          unselectedItemColor: Colors.grey.shade400,
          type: BottomNavigationBarType.shifting,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Reading',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      );
    });
  }
}
