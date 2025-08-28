import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticksy/Screens/HomeScreen.dart';

class LoginController extends GetxController {
  // Add your login logic here
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formUsrKey = GlobalKey<FormState>();
  final formPassKey = GlobalKey<FormState>();

  bool isPasswordHidden = true;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Add more validation logic if needed
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    // Add more validation logic if needed
    return null;
  }

  void login() {
    // if (formUsrKey.currentState!.validate() &&
    //     formPassKey.currentState!.validate()) {
    //   // Perform login
    // }
    Get.to(() => HomeScreen());
  }
}
