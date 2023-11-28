import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ForgotPasswordScreen());
}

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    }
    return null;
  }

  //Firebase Code
  // Function to send OTP using Firebase Auth
  Future<void> sendOTP(BuildContext context, String phoneNumber) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+91$phoneNumber", // Replace with your country code
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          // Navigate to OTP verification screen and pass verificationId
          Navigator.pushNamed(context, 'OtpVerification', arguments: verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print("Error sending OTP: $e");
      // Handle the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/boy1.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 280,
                  child: Text(
                    "Enter the mobile number associated with your account.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  child: Text(
                    "We will send you a otp to reset your password.",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: phoneNumberController,
                  validator: validateMobileNumber,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                  ),
                  keyboardType: TextInputType.phone,
                  // You can set the controller for this TextFormField
                ),
                SizedBox(height: 40),
                Container(
                  width: 120,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, send OTP
                        sendOTP(context, phoneNumberController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Send",
                      style: TextStyle(fontSize: 18),
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
