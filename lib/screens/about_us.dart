import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('About Us',
          style: GoogleFonts.crimsonText(
              color: Color(0xFF162a40),
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF162a40)),
        backgroundColor: Colors.white,
      ),
      body: 
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('With the advancement of technology and its applications technology has become a necessity of\n life the concept of electronic payment and its urgency began to emerge after the advent of ecommerce\n Many types of people encounter problems during their financial transactions\nSome of these problems compete with people during payment after the distance from the university to be paid\nso we found a way to facilitate the payment process and reduce the obstacles that may occur during payment\nAs a result, the online payment application ensures confidentiality and privacy in the transfer process and facilitates online financial procedures'
            ),
          ),
 
 
      
    );
  }
}