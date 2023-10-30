// // import 'dart:convert';
// // import 'package:betting_app/app_homescreen.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: AuthScreen(),
// //     );
// //   }
// // }
// //
// // class AuthScreen extends StatelessWidget {
// //   final TextEditingController mobileNumberController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //
// //   // Validators
// //   String? validateMobileNumber(String? value) {
// //     if (value == null || value.isEmpty) {
// //       return 'Mobile number is required';
// //     }
// //     if (value.length != 10) {
// //       return 'Mobile number must be 10 digits';
// //     }
// //     return null;
// //   }
// //
// //   String? validatePassword(String? value) {
// //     if (value == null || value.isEmpty) {
// //       return 'Password is required';
// //     }
// //     if (value.length < 6) {
// //       return 'Password must be at least 6 characters';
// //     }
// //     if (!value.contains(RegExp(r'[A-Za-z]')) ||
// //         !value.contains(RegExp(r'[0-9]'))) {
// //       return 'Password must contain both letters and numbers';
// //     }
// //     return null;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // appBar: AppBar(
// //       //   title: Center(child: Text("Cripx")),
// //       // ),
// //       body: Container(
// //         decoration: BoxDecoration(
// //           image: DecorationImage(
// //             image: AssetImage('assets/images/splash_img.jpg'),
// //             fit: BoxFit.cover
// //           ),
// //         ),
// //         child: Padding(
// //           padding: EdgeInsets.all(20.0),
// //           child: Form(
// //             key: _formKey,
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.only(bottom: 38.0),
// //                   child: Center(
// //                       child: Text(
// //                     'Welcome To Cripx',
// //                     style: TextStyle(fontSize: 30,fontFamily:'schyler',)
// //                   )),
// //                 ),
// //                 TextFormField(
// //                   keyboardType: TextInputType.number,
// //                   controller: mobileNumberController, // Added controller
// //                   validator: validateMobileNumber,
// //                   decoration: InputDecoration(
// //                     suffixIcon: Icon(Icons.phone),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(25),
// //                       borderSide: BorderSide(
// //                         color: Colors.black,
// //                         width: 2,
// //                       ),
// //                     ),
// //                     suffixIconColor: Colors.red,
// //                     labelText: 'Mobile Number',
// //                   ),
// //                 ),
// //                 SizedBox(height: 20.0),
// //                 TextFormField(
// //                   controller: passwordController, // Added controller
// //                   validator: validatePassword,
// //                   decoration: InputDecoration(
// //                       focusedBorder: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(25),
// //                           borderSide: BorderSide(
// //                             color: Colors.black,
// //                             width: 2,
// //                           )),
// //                       suffixIconColor: Colors.red,
// //                       suffixIcon: Icon(Icons.lock),
// //                       labelText: 'Password'),
// //                   obscureText: true,
// //                 ),
// //                 SizedBox(height: 20.0),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     if (_formKey.currentState!.validate()) {
// //                       // Form is valid, perform your login logic here
// //                       login(context); // Pass the context to the login function
// //                     }
// //                   },
// //                   child: Text(
// //                     'Login',
// //                     style: TextStyle(fontSize: 20, color: Colors.white),
// //                   ),
// //                 ),
// //                 TextButton(
// //                   onPressed: () {
// //                     Navigator.pushNamed(context, 'phone');
// //                   },
// //                   child: Text(
// //                     'Account Signup',
// //                     style: TextStyle(fontSize: 20),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // API Validation
// //   void login(BuildContext context) async {
// //     if (passwordController.text.isNotEmpty &&
// //         mobileNumberController.text.isNotEmpty) {
// //       print('Sending login request...');
// //
// //       var response = await http.post(
// //           Uri.parse('https://cripx.provisioningtech.com/get_ajax/login'),
// //           headers: {
// //             'Client-Service': 'frontend-client',
// //             'Auth-Key': 'simplerestapi'
// //           },
// //           body: {
// //             "user_id": mobileNumberController.text,
// //             // Use mobileNumberController
// //             "password": passwordController.text,
// //           });
// //
// //       print('Response status code: ${response.statusCode}');
// //       print(
// //           'Response body: ${response.body}'); // Print the response status code and body
// //
// //       if (response.statusCode == 200) {
// //         // Map<String, dynamic> user = jsonDecode(response);
// //         final body = jsonDecode(response.body);
// //         // ScaffoldMessenger.of(context)
// //         //     .showSnackBar(SnackBar(content: Text("Token : ${body['token']}")));
// //         pageRoute(context, body['token']); // Pass context to pageRoute
// //         // print('ID ' + body["id"]);
// //         // print('Login Token ' + body["token"]);
// //       } else {
// //         ScaffoldMessenger.of(context)
// //             .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
// //       }
// //     } else {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text('Blank Value')));
// //     }
// //   }
// //
// //   // Define the pageRoute function here
// //   void pageRoute(BuildContext context, String token) async {
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     await pref.setString("login", token);
// //     Navigator.push(
// //         context, MaterialPageRoute(builder: (context) => HomePage()));
// //   }
// // }
//
// import 'dart:convert';
// import 'package:betting_app/app_homescreen.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AuthScreen(),
//     );
//   }
// }
//
// class AuthScreen extends StatelessWidget {
//   final TextEditingController mobileNumberController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Validators
//   String? validateMobileNumber(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Mobile number is required';
//     }
//     if (value.length != 10) {
//       return 'Mobile number must be 10 digits';
//     }
//     return null;
//   }
//
//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     }
//     if (value.length < 6) {
//       return 'Password must be at least 6 characters';
//     }
//     if (!value.contains(RegExp(r'[A-Za-z]')) ||
//         !value.contains(RegExp(r'[0-9]'))) {
//       return 'Password must contain both letters and numbers';
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: WillPopScope(
//         onWillPop: () async {
//           // Intercept the back button press and handle it
//           if (Navigator.of(context).userGestureInProgress) {
//             return false; // Disable the back button during a user gesture
//           } else {
//             return true; // Allow the back button press if not during a user gesture
//           }
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/splash_img.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(20.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 38.0),
//                     child: Center(
//                       child: Text(
//                         'Welcome To Cripx',
//                         style: TextStyle(fontSize: 30, fontFamily: 'schyler',),
//                       ),
//                     ),
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     controller: mobileNumberController,
//                     validator: validateMobileNumber,
//                     decoration: InputDecoration(
//                       suffixIcon: Icon(Icons.phone),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2,
//                         ),
//                       ),
//                       suffixIconColor: Colors.red,
//                       labelText: 'Mobile Number',
//                     ),
//                   ),
//                   SizedBox(height: 20.0),
//                   TextFormField(
//                     controller: passwordController,
//                     validator: validatePassword,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2,
//                         ),
//                       ),
//                       suffixIconColor: Colors.red,
//                       suffixIcon: Icon(Icons.lock),
//                       labelText: 'Password',
//                     ),
//                     obscureText: true,
//                   ),
//                   SizedBox(height: 20.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         login(context);
//                       }
//                     },
//                     child: Text(
//                       'Login',
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, 'phone');
//                     },
//                     child: Text(
//                       'Account Signup',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void login(BuildContext context) async {
//     if (passwordController.text.isNotEmpty &&
//         mobileNumberController.text.isNotEmpty) {
//       print('Sending login request...');
//
//       var response = await http.post(
//           Uri.parse('https://cripx.provisioningtech.com/get_ajax/login'),
//           headers: {
//             'Client-Service': 'frontend-client',
//             'Auth-Key': 'simplerestapi'
//           },
//           body: {
//             "user_id": mobileNumberController.text,
//             "password": passwordController.text,
//           });
//
//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');
//
//       if (response.statusCode == 200) {
//         final body = jsonDecode(response.body);
//         pageRoute(context, body['token']);
//       } else {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
//       }
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Blank Value')));
//     }
//   }
//
//   void pageRoute(BuildContext context, String token) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setString("login", token);
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => HomePage()));
//   }
// }
//
// import 'dart:convert';
// import 'package:betting_app/app_homescreen.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AuthScreen(),
//     );
//   }
// }
//
// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }
//
// class _AuthScreenState extends State<AuthScreen> {
//   final TextEditingController mobileNumberController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//     checkLoginStatus();
//   }
//
//
//
//
// // Checking user is logged in before or not
//   void checkLoginStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString("login");
//     if (token != null) {
//       // User is logged in, navigate to the home screen
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => HomePage()));
//     }
//   }
// // Function to save the mobile number to shared preferences
//   Future<void> saveMobileNumber(String mobileNumber) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('mobileNumber', mobileNumber);
//   }
//   // Validators
//   String? validateMobileNumber(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Mobile number is required';
//     }
//     if (value.length != 10) {
//       return 'Mobile number must be 10 digits';
//     }
//     return null;
//   }
//
//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     }
//     if (value.length < 6) {
//       return 'Password must be at least 6 characters';
//     }
//     if (!value.contains(RegExp(r'[A-Za-z]')) ||
//         !value.contains(RegExp(r'[0-9]'))) {
//       return 'Password must contain both letters and numbers';
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: WillPopScope(
//         onWillPop: () async {
//           // Intercept the back button press and handle it
//           if (Navigator.of(context).userGestureInProgress) {
//             return false; // Disable the back button during a user gesture
//           } else {
//             return true; // Allow the back button press if not during a user gesture
//           }
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/splash_img.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(20.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 38.0),
//                     child: Center(
//                       child: Text(
//                         'Welcome To Cripx',
//                         style: TextStyle(fontSize: 30, fontFamily: 'schyler',),
//                       ),
//                     ),
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     controller: mobileNumberController,
//                     validator: validateMobileNumber,
//                     decoration: InputDecoration(
//                       suffixIcon: Icon(Icons.phone),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2,
//                         ),
//                       ),
//                       suffixIconColor: Colors.red,
//                       labelText: 'Mobile Number',
//                     ),
//                   ),
//                   SizedBox(height: 20.0),
//                   TextFormField(
//                     controller: passwordController,
//                     validator: validatePassword,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2,
//                         ),
//                       ),
//                       suffixIconColor: Colors.red,
//                       suffixIcon: Icon(Icons.lock),
//                       labelText: 'Password',
//                     ),
//                     obscureText: true,
//                   ),
//                   SizedBox(height: 20.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         login(context);
//                       }
//                     },
//                     child: Text(
//                       'Login',
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, 'phone');
//                     },
//                     child: Text(
//                       'Account Signup',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void login(BuildContext context) async {
//     if (passwordController.text.isNotEmpty &&
//         mobileNumberController.text.isNotEmpty) {
//       print('Sending login request...');
//
//       var response = await http.post(
//           Uri.parse('https://cripx.provisioningtech.com/get_ajax/login'),
//           headers: {
//             'Client-Service': 'frontend-client',
//             'Auth-Key': 'simplerestapi'
//           },
//           body: {
//             "user_id": mobileNumberController.text,
//             "password": passwordController.text,
//           });
//
//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');
//
//       if (response.statusCode == 200) {
//         final body = jsonDecode(response.body);
//         // Save the mobile number to shared preferences
//         saveMobileNumber(mobileNumberController.text);
//         pageRoute(context, body['token']);
//       } else {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
//       }
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Blank Value')));
//     }
//   }
//
//   void pageRoute(BuildContext context, String token) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setString("login", token);
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => HomePage()));
//   }
// }


import 'dart:convert';
import 'package:betting_app/app_homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("login");
    String? userId = prefs.getString("userId"); // Add this line

    if (token != null) {
      // print("Login token: $token"); // Print the token to the console
      // print("User ID: $userId"); // Print the user ID to the console
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  Future<void> saveMobileNumber(String mobileNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('mobileNumber', mobileNumber);
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('login', token);
  }

  Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (!value.contains(RegExp(r'[A-Za-z]')) || !value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain both letters and numbers';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (Navigator.of(context).userGestureInProgress) {
            return false;
          } else {
            return true;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash_img.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 38.0),
                    child: Center(
                      child: Text(
                        'Welcome To Cripx',
                        style: TextStyle(fontSize: 30, fontFamily: 'schyler',),
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: mobileNumberController,
                    validator: validateMobileNumber,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.phone),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      suffixIconColor: Colors.red,
                      labelText: 'Mobile Number',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: passwordController,
                    validator: validatePassword,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      suffixIconColor: Colors.red,
                      suffixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login(context);
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'phone');
                    },
                    child: Text(
                      'Account Signup',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    if (passwordController.text.isNotEmpty &&
        mobileNumberController.text.isNotEmpty) {
      print('Sending login request...');

      var response = await http.post(
        Uri.parse('https://cripx.provisioningtech.com/get_ajax/login'),
        headers: {
          'Client-Service': 'frontend-client',
          'Auth-Key': 'simplerestapi',
        },
        body: {
          "user_id": mobileNumberController.text,
          "password": passwordController.text,
        },
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        saveToken(body['token']);
        saveUserId(body['id']);
        saveMobileNumber(mobileNumberController.text);
        pageRoute(context, body['token']);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Blank Value')));
    }
  }

  void pageRoute(BuildContext context, String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", token);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}

