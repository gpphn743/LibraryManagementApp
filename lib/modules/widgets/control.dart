import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_management_app/modules/screens/account_screen.dart';
import 'package:library_management_app/modules/screens/book_list_screen.dart';
import 'package:library_management_app/modules/screens/borrowing_screen.dart';
import 'package:library_management_app/modules/screens/home_screen.dart';

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
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: _signOut,
              icon: const Icon(Icons.logout),
              tooltip: 'Sign Out',
            )
          ],
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Book List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'Borrowing',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
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
