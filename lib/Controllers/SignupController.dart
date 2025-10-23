import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticksy/APICalls/apirequests.dart';
import 'package:ticksy/Models/SignUpReq.dart';
import 'package:ticksy/Screens/HomeScreen.dart';

class SignupController extends GetxController {
  final api = ApiRequests();
  final signUpKey = GlobalKey<FormState>();
  final formPassKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordHidden = true;
  bool isSigningUp = false;
  Future<void> signup() async {
    if (!signUpKey.currentState!.validate()) return;

    try {
      isSigningUp = true;
      update();

      final signupData = SignUpReq(
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      await api.signup(signupData);

      Get.snackbar(
        'Success',
        'Signup completed successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );

      Get.to(() => HomeScreen());
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Signup failed: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isSigningUp = false;
      update();
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    final hasUpper = RegExp(r'[A-Z]').hasMatch(value);
    final hasLower = RegExp(r'[a-z]').hasMatch(value);
    final hasDigit = RegExp(r'\d').hasMatch(value);
    final hasSpecial = RegExp(r'[!@#\$&*~]').hasMatch(value);

    if (!hasUpper) return 'Password must contain at least one uppercase letter';
    if (!hasLower) return 'Password must contain at least one lowercase letter';
    if (!hasDigit) return 'Password must contain at least one number';
    if (!hasSpecial) {
      return 'Password must contain at least one special character (!@#\$&*~)';
    }
    return null;
  }
}
