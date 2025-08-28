import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticksy/Screens/DashboardScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // 👈 global background
      ),
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
