import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticksy/Controllers/SignupController.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (SignupController spController) {
        return Scaffold(
          backgroundColor: Color(0xFFE9E9E9),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: Get.width / 12,
            ).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: Form(
              key: spController.signUpKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: Get.height / 4.5),
                  Text(
                    'Sign Up',
                    style: GoogleFonts.alata(
                      fontSize: textScale.scale(32),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: Get.height / 14.54),
                  Container(
                    child: TextFormField(
                      //key: spController.formUsrKey,
                      style: GoogleFonts.alata(
                        fontSize: textScale.scale(18),
                        fontWeight: FontWeight.w200,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.person),
                        hintText: 'Enter Username',
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
                      controller: spController.usernameController,
                    ),
                  ),
                  SizedBox(height: Get.height / 38.09),
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
                      controller: spController.emailController,
                      validator: (value) => spController.validateEmail(value),
                    ),
                  ),
                  SizedBox(height: Get.height / 38.09),
                  Container(
                    child: TextFormField(
                      //key: spController.formPassKey,
                      style: GoogleFonts.alata(
                        fontSize: textScale.scale(18),
                        fontWeight: FontWeight.w200,
                      ),
                      obscureText: spController.isPasswordHidden,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            spController.isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            spController.isPasswordHidden =
                                !spController.isPasswordHidden;
                            spController.update();
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
                      controller: spController.passwordController,
                      validator: (value) =>
                          spController.validatePassword(value),
                    ),
                  ),

                  SizedBox(height: Get.height / 40),
                  Container(
                    width: double.infinity,
                    height: Get.height / 14.54,
                    child: ElevatedButton(
                      onPressed: () {
                        spController.signup();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: spController.isSigningUp
                          ? CircularProgressIndicator()
                          : Text(
                              ' Sign Up',
                              style: GoogleFonts.alata(
                                fontSize: textScale.scale(18),
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: Get.height / 4.8),
                  Text(
                    'if you already have account you can ',
                    style: GoogleFonts.alata(
                      fontSize: textScale.scale(17),
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Handle register tap
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login Here!',
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
