// // // //
// // // // import 'package:flutter/material.dart';
// // // // import 'package:shared_preferences/shared_preferences.dart';
// // // //
// // // // class LoginPage extends StatefulWidget {
// // // //   @override
// // // //   _LoginPageState createState() => _LoginPageState();
// // // // }
// // // //
// // // // class _LoginPageState extends State<LoginPage> {
// // // //   TextEditingController passwordController = TextEditingController();
// // // //   String mobileNumber = '';
// // // //
// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     loadMobileNumber();
// // // //   }
// // // //
// // // //   void loadMobileNumber() async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     setState(() {
// // // //       mobileNumber = prefs.getString('mobileNumber') ?? '';
// // // //     });
// // // //   }
// // // //
// // // //   void login() async {
// // // //     // Replace 'your_custom_password' with your desired password
// // // //     String customPassword = 'your_custom_password';
// // // //
// // // //     if (passwordController.text == customPassword) {
// // // //       // Password is correct, navigate to the next screen or perform other actions.
// // // //       // For now, we'll just print a message.
// // // //
// // // //       // Save the mobile number to shared preferences
// // // //       SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //       await prefs.setString('mobileNumber', mobileNumber);
// // // //
// // // //       // Retrieve the stored mobile number and use it as needed.
// // // //       print('Login successful');
// // // //       print('Mobile Number: $mobileNumber');
// // // //
// // // //       // You can add navigation to the next screen here if needed.
// // // //     } else {
// // // //       // Password is incorrect, show an error message or perform other actions.
// // // //       // For now, we'll just print a message.
// // // //       print('Login failed');
// // // //     }
// // // //   }
// // // //
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Center(child: Text('Make A New Password')),
// // // //       ),
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: <Widget>[
// // // //             Text('Mobile Number: $mobileNumber'),
// // // //             TextField(
// // // //               controller: passwordController,
// // // //               obscureText: true,
// // // //               decoration: InputDecoration(
// // // //                 hintText: 'Enter Password',
// // // //               ),
// // // //             ),
// // // //             SizedBox(height: 16.0),
// // // //             ElevatedButton(
// // // //               onPressed: login,
// // // //               child: Text('Login'),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // // import 'dart:convert';
// // // import 'package:http/http.dart' as http;
// // // import 'package:flutter/material.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // //
// // // void main() {
// // //   runApp(MaterialApp(
// // //     home: LoginPage(),
// // //   ));
// // // }
// // //
// // //
// // // class LoginPage extends StatefulWidget {
// // //   @override
// // //   _LoginPageState createState() => _LoginPageState();
// // // }
// // //
// // // class _LoginPageState extends State<LoginPage> {
// // //   TextEditingController passwordController = TextEditingController();
// // //   String mobileNumber = '';
// // //   final _formKey = GlobalKey<FormState>(); // Add a form key
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     loadMobileNumber();
// // //   }
// // //
// // //   void loadMobileNumber() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     setState(() {
// // //       mobileNumber = prefs.getString('mobileNumber') ?? '';
// // //     });
// // //   }
// // //   bool isAlphanumeric(String value) {
// // //     // Regular expression to check for alphanumeric characters
// // //     final alphanumericRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
// // //     return alphanumericRegex.hasMatch(value);
// // //   }
// // //   void login() async {
// // //     if (_formKey.currentState!.validate()) {
// // //       // Password is correct, navigate to the next screen or perform other actions.
// // //       // For now, we'll just print a message.
// // //
// // //       // Save the mobile number to shared preferences
// // //       SharedPreferences prefs = await SharedPreferences.getInstance();
// // //       await prefs.setString('mobileNumber', mobileNumber);
// // //
// // //       // Retrieve the stored mobile number and use it as needed.
// // //       print('Login successful');
// // //       print('Mobile Number: $mobileNumber');
// // //
// // //       // You can add navigation to the next screen here if needed.
// // //     }
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Center(child: Text('Make A New Password')),
// // //       ),
// // //       body: Center(
// // //         child: Form(
// // //           key: _formKey, // Assign the form key
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: <Widget>[
// // //               Text('Mobile Number: $mobileNumber'),
// // //               Padding(
// // //                 padding: const EdgeInsets.all(10.0),
// // //                 child: TextFormField(
// // //                   controller: passwordController,
// // //                   obscureText: true,
// // //                   decoration: InputDecoration(
// // //                    suffixIcon: Icon(Icons.password, color: Colors.red,),
// // //                     hintText: 'Enter Password',
// // //                   ),
// // //
// // //                   validator: (value) {
// // //                     if (value == null || value.isEmpty) {
// // //                       return 'Please enter a password';
// // //                     } else if (!isAlphanumeric(value)) {
// // //                       return 'Password must contain both letters and numbers';
// // //                     }
// // //                     return null;
// // //                   },
// // //                 ),
// // //               ),
// // //               SizedBox(height: 16.0),
// // //               ElevatedButton(
// // //                 onPressed: (){
// // //                   login(context); // Add this line to call the login function
// // //                 },
// // //                 child: Text('Login'),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // // API Validation
// // // void login(BuildContext context) async {
// // //   if (passwordController.text.isNotEmpty) {
// // //     print('Sending login request...');
// // //
// // //     var response = await http.post(
// // //       Uri.parse('https://cripx.provisioningtech.com/post_ajax/verify_account'),
// // //       headers: {
// // //         'Client-Service': 'frontend-client',
// // //         'Auth-Key': 'simplerestapi',
// // //       },
// // //       body: {
// // //         'username': 'abhi123',
// // //         'phone': '9528839350',
// // //         'token': 'ugegdygdegdygd'
// // //         // "username": MyPhone.passwordController.text, // Use mobileNumberController
// // //         // "phone":
// // //         // // Remove "password" field if it's not needed
// // //       },
// // //     );
// // //
// // //     print('Response status code: ${response.statusCode}');
// // //     print('Response body: ${response.body}'); // Print the response status code and body
// // //
// // //     if (response.statusCode == 200) {
// // //       final body = jsonDecode(response.body);
// // //       // ScaffoldMessenger.of(context)
// // //       //     .showSnackBar(SnackBar(content: Text("Token : ${body['token']}")));
// // //       // pageRoute(context, body['token']); // Pass context to pageRoute
// // //       // print('ID ' + body["id"]);
// // //       // print('Login Token ' + body["token"]);
// // //     } else {
// // //       ScaffoldMessenger.of(context)
// // //           .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
// // //     }
// // //   } else {
// // //     ScaffoldMessenger.of(context)
// // //         .showSnackBar(SnackBar(content: Text('Blank Value')));
// // //   }
// // // }
// // //
// // // // Define the pageRoute function here
// // // void pageRoute(BuildContext context, String token) async {
// // //   Navigator.push(
// // //       context, MaterialPageRoute(builder: (context) => LoginPage()));
// // // }
// //
// //
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: LoginPage(),
//   ));
// }
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController passwordController = TextEditingController();
//   String mobileNumber = '';
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//     loadMobileNumber();
//   }
//
//   void loadMobileNumber() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       mobileNumber = prefs.getString('mobileNumber') ?? '';
//       print('Mobile Number loaded from SharedPreferences: $mobileNumber'); // Add this print statement
//     });
//   }
//
//
//
//   bool isAlphanumeric(String value) {
//     final alphanumericRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
//     return alphanumericRegex.hasMatch(value);
//   }
//
//   void login() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         final response = await sendLoginRequest();
//
//         if (response.statusCode == 200) {
//           final body = jsonDecode(response.body);
//           // Handle success here
//           print('Login successful');
//           print('Mobile Number: $mobileNumber'); // Print mobileNumber here
//           print('Response data: $body');
//           // You can add navigation to the next screen here if needed.
//         }
//       } catch (e) {
//         // Handle network or other exceptions
//         print('Login failed with exception: $e');
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('An error occurred')));
//       }
//     }
//   }
//
//   Future<http.Response> sendLoginRequest() async {
//     final url = Uri.parse('https://cripx.provisioningtech.com/post_ajax/verify_account');
//     final response = await http.post(
//       url,
//       headers: {
//         'Client-Service': 'frontend-client',
//         'Auth-Key': 'simplerestapi',
//       },
//       body: {
//         'username': passwordController.text, // Use the entered password
//         'phone': mobileNumber, // Use the mobile number from SharedPreferences
//         'token': 'yourTokenHere', // Replace with your token
//       },
//     );
//     return response;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Make A New Password')),
//       ),
//       body: Center(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Mobile Number: $mobileNumber'),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: TextFormField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     suffixIcon: Icon(Icons.lock),
//                     hintText: 'Enter Password',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a password';
//                     } else if (!isAlphanumeric(value)) {
//                       return 'Password must contain both letters and numbers';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: login,
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//


import 'dart:convert';
import 'package:betting_app/app_homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  String mobileNumber = '';
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    loadMobileNumber();
  }

  String hideLastFourDigits(String phoneNumber) {
    if (phoneNumber.length >= 4) {
      final visibleDigits = phoneNumber.substring(0, phoneNumber.length - 4);
      final hiddenDigits = '*' * 4;
      return visibleDigits + hiddenDigits;
    } else {
      return phoneNumber; // Return the original number if it's less than 4 digits
    }
  }
  void loadMobileNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mobileNumber = prefs.getString('mobileNumber') ?? '';
      mobileNumberController.text = mobileNumber; // Set the text of the controller
      print('Mobile Number loaded from SharedPreferences: $mobileNumber');
    });
  }

  bool isAlphanumeric(String value) {
    final alphanumericRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    return alphanumericRegex.hasMatch(value);
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await sendLoginRequest();

        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          print('Login successful');
          print('Mobile Number: $mobileNumber');

          print('Response data: $body');

          // Now, let's print the Firebase User ID
          final user = _auth.currentUser;
          if (user != null) {
            print('Firebase User ID: ${user.uid}');
          } else {
            print('Not logged in to Firebase');
          }

          // You can add navigation to the next screen here if needed.
        }
      } catch (e) {
        print('Login failed with exception: $e');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('An error occurred')));
      }
    }
  }

  Future<http.Response> sendLoginRequest() async {
    final url = Uri.parse('https://cripx.provisioningtech.com/post_ajax/verify_account');
    final response = await http.post(
      url,
      headers: {
        'Client-Service': 'frontend-client',
        'Auth-Key': 'simplerestapi',
      },
      body: {
        'username': passwordController.text,
        'phone': mobileNumber,
        'token': 'yourTokenHere',
      },
    );
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Make A New Password')),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.cyan[200], // Replace with your desired background color
                    borderRadius: BorderRadius.circular(13.0), // Replace with your desired border radius
                  ),
                  padding: EdgeInsets.all(20.0), // Replace with your desired padding
                  child: Column(
                    children: [
                      Text('Your Verified Mobile Number :', style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black ),),
                      Center(
                        child: Text(
                          '${hideLastFourDigits(mobileNumber)}',
                          style: TextStyle(
                            fontSize: 16.0, // Replace with your desired font size
                            color: Colors.black, // Replace with your desired text color
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    hintText: 'Enter Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (!isAlphanumeric(value)) {
                      return 'Password must contain both letters and numbers';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
