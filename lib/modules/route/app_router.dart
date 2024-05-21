import 'package:flutter/material.dart';
import 'package:library_management_app/modules/route/route_name.dart';
import 'package:library_management_app/modules/screens/account_screen.dart';
import 'package:library_management_app/modules/screens/book_list_screen.dart';
import 'package:library_management_app/modules/screens/borrowing_screen.dart';
import 'package:library_management_app/modules/screens/home_screen.dart';
import 'package:library_management_app/modules/screens/login_screen.dart';
import 'package:library_management_app/modules/screens/page_not_found.dart';
import 'package:library_management_app/modules/screens/sign_up_screen.dart';

class AppRouter {
  AppRouter._instance();
  static final AppRouter instance = AppRouter._instance();

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(
            builder: (context) => const LoginScreen(),
            settings: const RouteSettings(name: RouteName.login));
      case RouteName.signUp:
        return MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
            settings: const RouteSettings(name: RouteName.signUp));
      case RouteName.home:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(),
            settings: const RouteSettings(name: RouteName.home));
      case RouteName.booklist:
        return MaterialPageRoute(
            builder: (context) => const BookListScreen(),
            settings: const RouteSettings(name: RouteName.booklist));
      case RouteName.borrowing:
        return MaterialPageRoute(
            builder: (context) => const BorrowingScreen(),
            settings: const RouteSettings(name: RouteName.borrowing));
      case RouteName.account:
        return MaterialPageRoute(
            builder: (context) => const AccountScreen(),
            settings: const RouteSettings(name: RouteName.account));
      default:
        return MaterialPageRoute(
          builder: (context) => const PageNotFound(),
        );
    }
  }
}
