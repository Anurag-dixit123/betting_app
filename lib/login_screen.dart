// import 'dart:convert';
// import 'package:betting_app/app_homescreen.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:betting_app/main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp();
//   }
// }
//   class AuthScreen extends StatelessWidget {
//     var mobileNumberController = TextEditingController();
//     var passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//
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
//       appBar: AppBar(
//         title: Center(child: Text("Crtpx")),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 38.0),
//                 child: Center(
//                     child: Text(
//                   'Welcome To Crtpx',
//                   style: TextStyle(fontSize: 30),
//                 )),
//               ),
//               TextFormField(
//                 controller: mobileNumberController,
//                 validator: validateMobileNumber,
//                 decoration: InputDecoration(
//                   suffixIcon: Icon(Icons.phone),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     borderSide: BorderSide(
//                       color: Colors.black,
//                       width: 2,
//                     ),
//                   ),
//                   suffixIconColor: Colors.red,
//                   labelText: 'Mobile Number',
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 controller: passwordController,
//                 validator: validatePassword,
//                 decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2,
//                         )),
//                     suffixIconColor: Colors.red,
//                     suffixIcon: Icon(Icons.lock),
//                     labelText: 'Password'),
//                 obscureText: true,
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Form is valid, perform your login logic here
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
//                   }
//                 },
//                 child: Text(
//                   'Login',
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, 'phone');
//                 },
//                 child: Text(
//                   'Account Signup',
//                   style: TextStyle(fontSize: 20, ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
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
//     return MaterialApp();
//   }
// }
//
// class AuthScreen extends StatelessWidget {
//   var mobileNumberController = TextEditingController();
//   var passwordController = TextEditingController();
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
//       appBar: AppBar(
//         title: Center(child: Text("Crtpx")),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 38.0),
//                 child: Center(
//                     child: Text(
//                       'Welcome To Crtpx',
//                       style: TextStyle(fontSize: 30),
//                     )),
//               ),
//               TextFormField(
//                 controller: mobileNumberController, // Added controller
//                 validator: validateMobileNumber,
//                 decoration: InputDecoration(
//                   suffixIcon: Icon(Icons.phone),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     borderSide: BorderSide(
//                       color: Colors.black,
//                       width: 2,
//                     ),
//                   ),
//                   suffixIconColor: Colors.red,
//                   labelText: 'Mobile Number',
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 controller: passwordController, // Added controller
//                 validator: validatePassword,
//                 decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2,
//                         )),
//                     suffixIconColor: Colors.red,
//                     suffixIcon: Icon(Icons.lock),
//                     labelText: 'Password'),
//                 obscureText: true,
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Form is valid, perform your login logic here
//                     String mobileNumber = mobileNumberController.text;
//                     String password = passwordController.text;
//                     // You can use mobileNumber and password in your login logic
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => HomePage()),
//                     );
//                   }
//                 },
//                 child: Text(
//                   'Login',
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, 'phone');
//                 },
//                 child: Text(
//                   'Account Signup',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// void login() async {
//   if (passwordController.text.isNotEmpty && mobileNumberController.text.isNotEmpty) {
//     var response = await http.post(
//         Uri.parse('https://provisioningtech.com/get_ajax/login'),
//         headers: {
//           'Client-Service': 'frontend-client',
//           'Auth-Key': 'simplerestapi'
//         },
//         body: {
//           "user_id": mobileNumber,
//           "password": passwordController.text
//         });
//
//     if (response.statusCode == 200) {
//       // Map<String, dynamic> user = jsonDecode(response);
//       final body = jsonDecode(response.body);
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Token : ${body['token']}")));
//       pageRoute(body['token']);
//       // print('ID ' + body["id"]);
//       // print('Login Token ' + body["token"]);
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
// void pageRoute(String token) async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   await pref.setString("login", token);
//   Navigator.push(
//       context, MaterialPageRoute(builder: (context) => DashBoard()));
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

class AuthScreen extends StatelessWidget {
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Validators
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
    if (!value.contains(RegExp(r'[A-Za-z]')) ||
        !value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain both letters and numbers';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Crtpx")),
      ),
      body: Padding(
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
                      'Welcome To Crtpx',
                      style: TextStyle(fontSize: 30),
                    )),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: mobileNumberController, // Added controller
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
                controller: passwordController, // Added controller
                validator: validatePassword,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        )),
                    suffixIconColor: Colors.red,
                    suffixIcon: Icon(Icons.lock),
                    labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, perform your login logic here
                    login(context); // Pass the context to the login function
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
    );
  }


  // API Validation
  void login(BuildContext context) async {
    if (passwordController.text.isNotEmpty &&
        mobileNumberController.text.isNotEmpty) {
      print('Sending login request...');

      var response = await http.post(
          Uri.parse('https://cripx.provisioningtech.com/get_ajax/login'),
          headers: {
            'Client-Service': 'frontend-client',
            'Auth-Key': 'simplerestapi'
          },
          body: {
            "user_id": mobileNumberController.text,
            // Use mobileNumberController
            "password": passwordController.text,
          });

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response
          .body}'); // Print the response status code and body


      if (response.statusCode == 200) {
        // Map<String, dynamic> user = jsonDecode(response);
        final body = jsonDecode(response.body);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Token : ${body['token']}")));
        pageRoute(context, body['token']); // Pass context to pageRoute
        print('ID ' + body["id"]);
        print('Login Token ' + body["token"]);
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
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", token);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}


