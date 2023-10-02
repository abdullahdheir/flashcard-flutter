import 'package:flashcard/core/classes/colors.dart';
import 'package:flashcard/core/routes/navigator.dart';
import 'package:flashcard/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcard UI',
      navigatorKey: AppRoute.navKey,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
              ),
        ),
        scaffoldBackgroundColor: AppColor.kBackgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.transparent,
          primary: AppColor.kPrimaryColor,
          secondary: AppColor.kSecondaryColor,
        ),
        fontFamily: GoogleFonts.rubik().fontFamily,
        textTheme: GoogleFonts.rubikTextTheme(),
      ),
      routes: appRoutes,
    );
  }
}
