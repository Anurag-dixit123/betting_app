import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

void main() {
  runApp(OTPVerificationScreen());
}

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance
  String errorMessage = '';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
          child: Column(
            children: <Widget>[
              Text(
                "OTP Verification",
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
                  "Enter the verification code we just sent to you on  your mobile number.",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              PinInputTextField(
                pinLength: 6,
                controller: otpController,
                keyboardType: TextInputType.number,
                onChanged: (otp) {
                  if (otp.length == 6) {
                    // Handle OTP verification when the length is 6
                  }
                },
                decoration: UnderlineDecoration(
                  colorBuilder: FixedColorBuilder(
                    Colors.orange.shade200
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("if you didn't receive a code!"),
                  TextButton(onPressed: (){

                  }
                      , child: Text('Resend', style: TextStyle(color: Colors.orange, fontSize: 15),))
                ],
              ),
              Text(
                errorMessage, // Display error message if present
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 120,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    // Handle the "Verify" button tap here
                    String otp = otpController.text;

                    if (otp.length == 6) {
                      try {
                        // Verify the OTP using Firebase Auth
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(
                          verificationId: ModalRoute.of(context)!.settings.arguments as String, // Retrieve the verificationId passed from the previous screen
                          smsCode: otp,
                        );
                        UserCredential userCredential = await _auth.signInWithCredential(credential);

                        if (userCredential.user != null) {
                          // OTP verification successful
                          Navigator.pushNamed(context, 'NewPassword');
                        } else {
                          // OTP verification failed
                          setState(() {
                            errorMessage = 'Wrong OTP. Please try again.';
                          });
                        }
                      } catch (e) {
                        print("Error verifying OTP: $e");
                        // Handle the error or show an error message
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text("Verify", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
