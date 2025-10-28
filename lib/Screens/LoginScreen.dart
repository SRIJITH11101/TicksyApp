import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticksy/Controllers/LoginController.dart';
import 'package:ticksy/Screens/SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (LoginController lgController) {
        return Scaffold(
          backgroundColor: Color(0xFFE9E9E9),
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: Get.width / 12,
            ).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: Form(
              key: lgController.loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: Get.height / 4.5),
                  Text(
                    'Log In',
                    style: GoogleFonts.alata(
                      fontSize: textScale.scale(32),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: Get.height / 14.54),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.alata(
                        fontSize: textScale.scale(18),
                        fontWeight: FontWeight.w200,
                      ),

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.email),
                        hintText: 'Enter Email',
                        hintStyle: GoogleFonts.alata(
                          fontSize: textScale.scale(18),
                          fontWeight: FontWeight.w200,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ), // when focused
                        ),
                      ),
                      controller: lgController.emailController,
                      validator: (value) => lgController.validateEmail(value),
                    ),
                  ),
                  SizedBox(height: Get.height / 38.09),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.alata(
                        fontSize: textScale.scale(18),
                        fontWeight: FontWeight.w200,
                      ),
                      obscureText: lgController.isPasswordHidden,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            lgController.isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            lgController.isPasswordHidden =
                                !lgController.isPasswordHidden;
                            lgController.update();
                          },
                        ),
                        hintText: 'Enter Password',
                        hintStyle: GoogleFonts.alata(
                          fontSize: textScale.scale(18),
                          fontWeight: FontWeight.w200,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ), // when focused
                        ),
                      ),
                      controller: lgController.passwordController,
                      validator: (value) =>
                          lgController.validatePassword(value),
                    ),
                  ),

                  SizedBox(height: Get.height / 72.72),
                  Align(
                    alignment: AlignmentGeometry.topRight,
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.alata(
                        fontSize: textScale.scale(16),
                        fontWeight: FontWeight.w200,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height / 40),
                  Container(
                    width: double.infinity,
                    height: Get.height / 14.54,
                    child: ElevatedButton(
                      onPressed: () {
                        lgController.login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: lgController.isLoggingIn
                          ? CircularProgressIndicator()
                          : Text(
                              'Log In',
                              style: GoogleFonts.alata(
                                fontSize: textScale.scale(18),
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: Get.height / 3.77),
                  Text(
                    'if you don’t an account you can',
                    style: GoogleFonts.alata(
                      fontSize: textScale.scale(17),
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Handle register tap
                      Get.to(() => SignupScreen());
                    },
                    child: Text(
                      'Register Here!',
                      style: GoogleFonts.alata(
                        fontSize: textScale.scale(17),
                        fontWeight: FontWeight.w200,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
