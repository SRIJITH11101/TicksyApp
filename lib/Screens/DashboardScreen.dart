import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticksy/Screens/LoginScreen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight / 30),
          Container(
            height: screenHeight / 2.69,
            width: screenWidth / 1.01,
            child: Image.asset('assets/images/dashboard_img.png'),
          ),
          SizedBox(height: screenHeight / 53.33),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth / 14.4),
              child: Text(
                'Support Made',
                style: GoogleFonts.alata(
                  fontSize: textScale.scale(40),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth / 14.4),
              child: Text(
                'Easy!!',
                style: GoogleFonts.alata(
                  fontSize: textScale.scale(40),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth / 14.4),
              child: Text(
                '\"Breaking barriers, building stronger connections.\"',
                style: GoogleFonts.alata(
                  fontSize: textScale.scale(15),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight / 21.62),

          InkWell(
            onTap: () {
              // Handle button tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Container(
              height: screenHeight / 17.02,
              width: screenWidth / 1.21,
              decoration: BoxDecoration(
                color: Color(0xFF1778F2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Get Started',
                  style: GoogleFonts.alata(
                    fontSize: textScale.scale(18),
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
