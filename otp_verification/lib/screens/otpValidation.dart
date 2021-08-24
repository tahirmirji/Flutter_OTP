import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_verification/screens/otpFields.dart';
import 'package:otp_verification/services/service.dart';

class otpCredential {
  static Map otpDigits = {
    'one': '',
    'two': '',
    'three': '',
    'four': '',
    'five': '',
    'six': '',
  };
  static String? code = '';
  static String? verificationID;
}

class OtpValidation extends StatefulWidget {
  const OtpValidation({Key? key}) : super(key: key);

  @override
  _OtpValidationState createState() => _OtpValidationState();
}

class _OtpValidationState extends State<OtpValidation> {
  otpService otp = otpService();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Here _data contain the phone number
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 70.0, 8.0, 0.0),
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Enter Verification Code',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.07),
                Icon(
                  Icons.message_rounded,
                  size: 60.0,
                ),
                SizedBox(height: screenHeight * 0.07),
                Text(
                  'Enter OTP sent to your mobile number',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  child: OtpForm(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
                  child: Container(
                    width: 300,
                    height: 45.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        int flag = 0;
                        String temp = '';
                        for (String key in otpCredential.otpDigits.keys) {
                          if (otpCredential.otpDigits[key] == '') {
                            flag = 1;
                          }
                          temp += otpCredential.otpDigits[key];
                        }
                        if (flag == 1) {
                          otp.showAlertDialog('Invalid OTP', context);
                          setState(() {
                            build(context);
                          });
                        } else {
                          otpCredential.code = temp;
                          try {
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId:
                                        otpCredential.verificationID.toString(),
                                    smsCode: otpCredential.code.toString());

                            final authCredential =
                                await _auth.signInWithCredential(credential);

                            if (authCredential.user != null) {
                              Navigator.pushReplacementNamed(
                                  context, '/homeScreen');
                            }
                          } catch (e) {
                            otp.showAlertDialog('Invalid OTP', context);
                          }
                        }
                      },
                      child: Text(
                        'Verify',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        primary: const Color.fromRGBO(255, 105, 40, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
