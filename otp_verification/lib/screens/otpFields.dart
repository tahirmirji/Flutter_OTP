import 'package:flutter/material.dart';
import 'package:otp_verification/screens/otpValidation.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode?.dispose();
    pin3FocusNode?.dispose();
    pin4FocusNode?.dispose();
    pin5FocusNode?.dispose();
    pin6FocusNode?.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Form(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 34,
                  child: TextFormField(
                    autofocus: true,
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.length == 0) {
                        otpCredential.otpDigits['one'] = '';
                      } else {
                        otpCredential.otpDigits['one'] = value;
                        nextField(value, pin2FocusNode!);
                      }
                    },
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 34,
                  child: TextFormField(
                    focusNode: pin2FocusNode,
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.length == 0) {
                        otpCredential.otpDigits['two'] = '';
                      } else {
                        otpCredential.otpDigits['two'] = value;
                        nextField(value, pin3FocusNode!);
                      }
                    },
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 34,
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.length == 0) {
                        otpCredential.otpDigits['three'] = '';
                      } else {
                        otpCredential.otpDigits['three'] = value;
                        nextField(value, pin4FocusNode!);
                      }
                    },
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 34,
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.length == 0) {
                        otpCredential.otpDigits['four'] = '';
                      } else {
                        otpCredential.otpDigits['four'] = value;
                        nextField(value, pin5FocusNode!);
                      }
                    },
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 34,
                  child: TextFormField(
                    focusNode: pin5FocusNode,
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.length == 0) {
                        otpCredential.otpDigits['five'] = '';
                      } else {
                        otpCredential.otpDigits['five'] = value;
                        nextField(value, pin6FocusNode!);
                      }
                    },
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 34,
                  child: TextFormField(
                    focusNode: pin6FocusNode,
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.length == 0) {
                        otpCredential.otpDigits['six'] = '';
                      } else if (value.length == 1) {
                        otpCredential.otpDigits['six'] = value;
                        pin6FocusNode?.unfocus();
                        // Then you need to check is the code is correct or not
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
