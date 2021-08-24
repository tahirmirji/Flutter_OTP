import 'package:flutter/material.dart';
import 'package:otp_verification/screens/home.dart';
import 'package:otp_verification/screens/otpScreen.dart';
import 'package:otp_verification/screens/otpValidation.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP Verification',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: OtpScreen(),
      routes: <String, WidgetBuilder>{
        '/otpValidation': (BuildContext ctx) => OtpValidation(),
        '/homeScreen': (BuildContext ctx) => Home(),
      },
    );
  }
}
