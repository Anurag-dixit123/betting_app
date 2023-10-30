// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// class MyPhone extends StatefulWidget {
//   const MyPhone({Key? key}) : super(key: key);
//
//   //Adding Code For Verification Id
//   static String verify ="";
//
//   @override
//   State<MyPhone> createState() => _MyPhoneState();
// }
//
// class _MyPhoneState extends State<MyPhone> {
//   TextEditingController countryController = TextEditingController();
//   TextEditingController mobileNumberController = TextEditingController(); // Added mobile number controller
//   var phone = "";
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     countryController.text = "+91";
//     super.initState();
//   }
//
//   // Function to save the mobile number to shared preferences
//   Future<void> saveMobileNumber(String mobileNumber) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('mobileNumber', mobileNumber);
//   }
//
//   // Validators
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       body: Container(
//         margin: EdgeInsets.only(left: 25, right: 25),
//         alignment: Alignment.center,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/logo.jpg',
//                 width: 150,
//                 height: 150,
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Text(
//                 "Phone Verification",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "We need to register your phone without getting started!",
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: 55,
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 10,
//                     ),
//                     SizedBox(
//                       width: 40,
//                       child: TextField(
//                         controller: countryController,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       "|",
//                       style: TextStyle(fontSize: 33, color: Colors.grey),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                         child: TextField(
//                           controller: mobileNumberController,
//                           onChanged: (value){
//                             phone=value;
//                           },
//                           keyboardType: TextInputType.phone,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "Phone",
//                           ),
//                         ))
//                   ],
//                 ),
//               ),
//
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.green.shade600,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     onPressed: () async {
//                       // Save the mobile number to shared preferences before navigating to the next page
//                       await saveMobileNumber('${countryController.text + phone}');
//
//                       await FirebaseAuth.instance.verifyPhoneNumber(
//                         phoneNumber: '${countryController.text + phone }',
//                         verificationCompleted: (PhoneAuthCredential credential) {},
//                         verificationFailed: (FirebaseAuthException e) {},
//                         codeSent: (String verificationId, int? resendToken) {
//                           MyPhone.verify=verificationId;
//                           Navigator.pushNamed(context, 'verify');
//                         },
//                         codeAutoRetrievalTimeout: (String verificationId) {},
//                       );
//                     },
//                     child: Text("Send the code")),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:betting_app/verify.dart';
// import 'package:http/http.dart' as http;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class MyPhone extends StatefulWidget {
//   const MyPhone({Key? key}) : super(key: key);
//
//   // Adding Code For Verification Id
//   static String verify = "";
//
//   @override
//   State<MyPhone> createState() => _MyPhoneState();
// }
//
// class _MyPhoneState extends State<MyPhone> {
//   TextEditingController countryController = TextEditingController();
//   TextEditingController mobileNumberController = TextEditingController();
//   var phone = "";
//
//   final _formKey = GlobalKey<FormState>(); // Add the form key
//
//   @override
//   void initState() {
//     countryController.text = "+91";
//     mobileNumberController.text = "";
//     super.initState();
//   }
//
//   // Function to save the mobile number to shared preferences
//   Future<void> saveMobileNumber(String mobileNumber) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('mobileNumber', mobileNumber);
//   }
//
//   // Validators
//   String? validateMobileNumber(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Mobile number is required';
//     }
//     if (value.length < 10) {
//       return 'Mobile number must be at least 10 digits';
//     }
//     if (value.length > 10) {
//       return 'Mobile number cannot exceed 10 digits';
//     }
//     return null; // Return null if validation passes
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey, // Assign the form key
//         child: Container(
//           margin: EdgeInsets.only(left: 25, right: 25),
//           alignment: Alignment.center,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/images/logo.jpg',
//                   width: 150,
//                   height: 150,
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Text(
//                   "Phone Verification",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "We need to register your phone without getting started!",
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   height: 55,
//                   decoration: BoxDecoration(
//                       border: Border.all(width: 1, color: Colors.grey),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         width: 10,
//                       ),
//                       SizedBox(
//                         width: 40,
//                         child: TextFormField(
//                           controller: countryController,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         "|",
//                         style: TextStyle(fontSize: 33, color: Colors.grey),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: TextFormField(
//                           controller: mobileNumberController,
//                           onChanged: (value) {
//                             phone = value;
//                           },
//                           keyboardType: TextInputType.phone,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "Phone",
//                           ),
//                           validator: validateMobileNumber, // Add the validator here
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 45,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.green.shade600,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     onPressed: () async {
//                       // Validate the form
//                       if (_formKey.currentState!.validate()) {
//                         // Form is valid, proceed with sending the code
//                         await saveMobileNumber('${countryController.text + phone}');
//
//                         await FirebaseAuth.instance.verifyPhoneNumber(
//                           phoneNumber: '${countryController.text + phone}',
//                           verificationCompleted: (PhoneAuthCredential credential) {},
//                           verificationFailed: (FirebaseAuthException e) {},
//                           codeSent: (String verificationId, int? resendToken) {
//                             MyPhone.verify = verificationId;
//                             Navigator.pushNamed(context, 'verify');
//                           },
//                           codeAutoRetrievalTimeout: (String verificationId) {},
//                         );
//                       }
//                     },
//                     child: Text("Send the code"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// // API Validation
// void login(BuildContext context) async {
//   if (mobileNumberController.text.isNotEmpty) {
//     print('Sending login request...');
//
//     var response = await http.post(
//       Uri.parse('https://cripx.provisioningtech.com/get_ajax/login'),
//       headers: {
//         'Client-Service': 'frontend-client',
//         'Auth-Key': 'simplerestapi',
//       },
//       body: {
//         "user_id": mobileNumberController.text, // Use mobileNumberController
//         // Remove "password" field if it's not needed
//       },
//     );
//
//     print('Response status code: ${response.statusCode}');
//     print('Response body: ${response.body}'); // Print the response status code and body
//
//     if (response.statusCode == 200) {
//       final body = jsonDecode(response.body);
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Token : ${body['token']}")));
//       pageRoute(context, body['token']); // Pass context to pageRoute
//       print('ID ' + body["id"]);
//       print('Login Token ' + body["token"]);
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
//     }
//   } else {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text('Blank Value')));
//   }
// }
//
//
//
// // Define the pageRoute function here
// void pageRoute(BuildContext context, String token) async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   await pref.setString("login", token);
//   Navigator.push(
//       context, MaterialPageRoute(builder: (context) =>  MyVerify()));
// }



import 'dart:convert';
import 'package:betting_app/verify.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  // Adding Code For Verification Id
  static String verify = "";
  static TextEditingController mobileNumberController = TextEditingController(); // Make it static
  static String firebaseToken = ""; // Add this variable to store the Firebase token
  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
   var phone = "";

  final _formKey = GlobalKey<FormState>(); // Add the form key

  @override
  void initState() {
    countryController.text = "+91";
    MyPhone.mobileNumberController.text = "";
    super.initState();
  }

  // Function to save the mobile number to shared preferences
  Future<void> saveMobileNumber(String mobileNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('mobileNumber', mobileNumber);
  }

  // Validators
  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    if (value.length < 10) {
      return 'Mobile number must be at least 10 digits';
    }
    if (value.length > 10) {
      return 'Mobile number cannot exceed 10 digits';
    }
    return null; // Return null if validation passes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey, // Assign the form key
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.jpg',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Phone Verification",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "We need to register your phone without getting started!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 40,
                        child: TextFormField(
                          controller: countryController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(fontSize: 33, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: MyPhone.mobileNumberController,
                          onChanged: (value) {
                            phone = value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                          validator: validateMobileNumber, // Add the validator here
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      // Validate the form
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with sending the code

                        // await saveMobileNumber('${countryController.text + phone}');
                        await saveMobileNumber(phone);

                        // Call the login function to make the API request
                        PhoneApi(context); // Add this line to call the login function

                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '${countryController.text + phone}',
                          verificationCompleted: (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            MyPhone.verify = verificationId;
                            Navigator.pushNamed(context, 'verify');
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      }
                    },
                    child: Text("Send the code"),
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

// API Validation
void PhoneApi(BuildContext context) async {
  if (MyPhone.mobileNumberController.text.isNotEmpty) {
    print('Sending login request...');

    var response = await http.post(
      Uri.parse('https://cripx.provisioningtech.com/post_ajax/verify_account'),
      headers: {
        'Client-Service': 'frontend-client',
        'Auth-Key': 'simplerestapi',
      },
      body: {
        "username": MyPhone.mobileNumberController.text, // Use mobileNumberController
        // Remove "password" field if it's not needed
      },
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}'); // Print the response status code and body

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Token : ${body['token']}")));
      // pageRoute(context, body['token']); // Pass context to pageRoute
      // print('ID ' + body["id"]);
      // print('Login Token ' + body["token"]);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Blank Value')));
  }
}

// Define the pageRoute function here
void pageRoute(BuildContext context, String token) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyVerify()));
}
