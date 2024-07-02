import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management_app/modules/route/app_router.dart';
import 'package:library_management_app/modules/screens/account_screen.dart';
import 'package:library_management_app/modules/screens/book_list_screen.dart';
import 'package:library_management_app/modules/screens/borrowing_screen.dart';
import 'package:library_management_app/modules/service/books_provider.dart';
import 'package:library_management_app/modules/service/google_books_service.dart';
import 'package:library_management_app/modules/widgets/auth_wrapper.dart';
import 'package:library_management_app/modules/widgets/control.dart';
import 'package:library_management_app/modules/screens/home_screen.dart';
import 'package:library_management_app/modules/screens/login_screen.dart';
import 'package:library_management_app/modules/screens/sign_up_screen.dart';
import 'package:library_management_app/modules/themes/app_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
          create: (context) => BooksProvider(apiService: ApiService()),
        ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false, //hide debug tag
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
            useMaterial3: true,
            fontFamily: GoogleFonts.dmSans().fontFamily,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(),
              bodyMedium: TextStyle(),
              bodySmall: TextStyle(),
            ).apply(
              bodyColor: AppColors.mainColor,
              displayColor: AppColors.mainColor,
            ),
          ),
          home: const AuthWrapper(),
          onGenerateRoute: AppRouter.instance.onGenerateRoute,
        ));
  }
}
