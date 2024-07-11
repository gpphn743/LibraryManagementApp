import 'package:flutter/material.dart';
import 'package:library_management_app/modules/route/route_name.dart';
import 'package:library_management_app/modules/service/firestore_service.dart';
import 'package:library_management_app/modules/themes/spacing.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController _usernameController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final firestoreService =
        Provider.of<FirestoreService>(context, listen: false);
    final username = await firestoreService.getUserInfo();
    setState(() {
      _usernameController.text = username ?? '';
      isLoading = false;
    });
  }

  Future<void> _updateUsername() async {
    final firestoreService =
        Provider.of<FirestoreService>(context, listen: false);
    await firestoreService.setUserInfo(_usernameController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Username updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                'User Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.amber,
                ),
              ),
              Spacing.v10,
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
                    image: AssetImage("assets/images/shoes.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacing.v10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: _usernameController,
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
              Spacing.v20,
              ElevatedButton(
                onPressed: _updateUsername,
                child: const Text('Save'), //only username for now!
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
