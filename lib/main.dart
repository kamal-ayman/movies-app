import 'package:flutter/material.dart';
import 'package:movies/core/services/sevices_locator.dart';
import 'package:movies/movies/presentation/screens/movies_screen.dart';

import 'core/utils/app_string.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        textTheme: const TextTheme().copyWith(
          titleMedium: const TextStyle().copyWith(color: Colors.white),
          bodyMedium:  const TextStyle().copyWith(color: Colors.white),
          titleLarge: const TextStyle().copyWith(color: Colors.white),
        ),

        scaffoldBackgroundColor: Colors.grey.shade900,
        useMaterial3: true,
      ),
      home: const MoviesScreen(),
    );
  }
}
