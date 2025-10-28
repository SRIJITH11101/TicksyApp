import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ticksy/APICalls/ApiRequests.dart';
import 'package:ticksy/Models/AuthRes.dart';
import 'package:ticksy/Models/loginReq.dart';
import 'package:ticksy/Screens/HomeScreen.dart';

class LoginController extends GetxController {
  // Add your login logic here
  final api = ApiRequests();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  final authStorage = GetStorage();
  //final formPassKey = GlobalKey<FormState>();
  bool isLoggingIn = false;

  bool isPasswordHidden = true;

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

  Future<void> login() async {
    if (!loginKey.currentState!.validate()) return;

    try {
      isLoggingIn = true;
      update();

      final loginData = LoginReq(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      AuthRes? res = await api.login(loginData);

      if (res != null) {
        authStorage.write('accessToken', res.accessToken);
        authStorage.write('refreshToken', res.refreshToken);
        authStorage.write('userId', res.userId);
        authStorage.write('username', res.username);
      }
      // Handle response as needed

      Get.snackbar(
        'Success',
        'Login successful!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );

      // Navigate to HomeScreen
      Get.to(() => HomeScreen());
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Login failed: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoggingIn = false;
      update();
    }
  }
}
