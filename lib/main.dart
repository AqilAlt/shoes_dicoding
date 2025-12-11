import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MySnkrApp());
}

class MySnkrApp extends StatelessWidget {
  const MySnkrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mySnkr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF111827)),
        scaffoldBackgroundColor: const Color(0xFFF9FAFB),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF111827)),
          titleMedium: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF111827)),
          bodyMedium: TextStyle(color: Color(0xFF374151)),
        ),
      ),
      home: const HomePage(),
    );
  }
}