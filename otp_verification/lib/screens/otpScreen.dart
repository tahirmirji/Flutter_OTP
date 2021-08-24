import 'package:flutter/material.dart';
import 'package:otp_verification/services/service.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final myController = TextEditingController();
  otpService otp = otpService();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.07),
                Icon(
                  Icons.av_timer,
                  size: 60.0,
                ),
                SizedBox(height: screenHeight * 0.07),
                Text(
                  'Enter your mobile number we will send a OTP message',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  child: Container(
                    width: 280,
                    height: 45.0,
                    child: TextField(
                      controller: myController,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        icon: Text(
                          '+91',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
                  child: Container(
                    width: 300,
                    height: 45.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (myController.text.length != 10) {
                          otp.showAlertDialog(
                              'The provided phone number is not valid.',
                              context);
                          setState(() {
                            build(context);
                          });
                        } else {
                          await otp.registerUser(myController.text, context);
                          Navigator.pushReplacementNamed(
                              context, '/otpValidation');
                        }
                      },
                      child: Text(
                        'Send OTP',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
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
