import 'package:flutter/material.dart';
import 'package:otp_verification/screens/otpFields.dart';

class OtpValidation extends StatefulWidget {
  const OtpValidation({Key? key}) : super(key: key);

  @override
  _OtpValidationState createState() => _OtpValidationState();
}

class _OtpValidationState extends State<OtpValidation> {
  Map _data = {};

  @override
  Widget build(BuildContext context) {
    // Here _data contain the phone number
    _data = ModalRoute.of(context)!.settings.arguments as Map;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 100.0, 8.0, 0.0),
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Enter Verification Code',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.07),
                Icon(
                  Icons.message,
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
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/homeScreen');
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
