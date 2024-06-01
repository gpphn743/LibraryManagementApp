import 'package:flutter/material.dart';
import 'package:library_management_app/modules/route/route_name.dart';
import 'package:library_management_app/modules/themes/spacing.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('AccountScreen'),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.amber,
                    width: 2.0, //độ dày của border
                  ),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/unnamed.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacing.v10,
              const Text(
                'PopCat!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.amber,
                ),
              ),
              Spacing.v10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    labelText: 'Email Address',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_rounded),
                    ),
                  ),
                ),
              ),
              Spacing.v10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    labelText: 'Username',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_rounded),
                    ),
                  ),
                ),
              ),
              Spacing.v10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_rounded),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
