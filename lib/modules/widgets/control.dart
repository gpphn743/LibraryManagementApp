import 'package:flutter/material.dart';
import 'package:library_management_app/modules/route/route_name.dart';
import 'package:library_management_app/modules/screens/account_screen.dart';
import 'package:library_management_app/modules/screens/book_list_screen.dart';
import 'package:library_management_app/modules/screens/borrowing_screen.dart';
import 'package:library_management_app/modules/screens/home_screen.dart';
import 'package:library_management_app/modules/themes/app_color.dart';
import 'package:library_management_app/modules/themes/spacing.dart';

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
    // switch (index) {
    //   case 0:
    //     Navigator.pushNamed(context, RouteName.home);
    //     break;
    //   case 1:
    //     Navigator.pushNamed(context, RouteName.booklist);
    //     break;
    //   case 2:
    //     Navigator.pushNamed(context, RouteName.borrowing);
    //     break;
    //   case 3:
    //     Navigator.pushNamed(context, RouteName.account);
    //     break;

    //   default:
    //     // Handle unknown index (optional)
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_outlined),
              tooltip: 'Settings',
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

