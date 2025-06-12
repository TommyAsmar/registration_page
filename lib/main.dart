import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registration_page/Routes/AppPage.dart';
import 'package:registration_page/Routes/AppRoute.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Registration Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        textTheme: const TextTheme(
          labelLarge: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      initialRoute: AppRoute.register,
      getPages: AppPage.pages,
    );
  }
}
