import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContestsDetail extends StatelessWidget {
  const ContestsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.black,
      toolbarHeight: 190,
      flexibleSpace: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 47, left: 24, right: 247),
              child: Image.asset(
                'lib/assets/images/logo.png',
                fit: BoxFit.contain,
              )),
          Padding(
              padding: const EdgeInsets.only(top: 32, left: 24),
              child: Text(
                'FIND AND ENJOY',
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 0.7
                          ..color = Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'YOUR FAVORITE DUNK',
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              )),
        ],
      ),
    ),);
  }
}
