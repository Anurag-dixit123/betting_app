//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:betting_app/app_homescreen.dart';
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
//       print('Mobile Number loaded from SharedPreferences: $mobileNumber');
//     });
//   }
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
//         print('Response status code: ${response.statusCode}'); // Print the response code
//
//         if (response.statusCode == 200) {
//           print('Mobile Number: $mobileNumber');
//           final body = jsonDecode(response.body);
//           // print('Response status code: ${response.statusCode}');
//           print('Response body: ${response.body}'); // Print the response status code and body
//
//           print('Login successful');
//           // You can add navigation to the next screen here if needed.
//
//           // Add the navigation logic here when the status code is 200
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => HomePage()), // Replace with your next page
//           );
//         } else {
//           print('Login failed with status code ${response.statusCode}');
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text('Login failed')));
//         }
//       } catch (e) {
//         print('Login failed with exception: $e');
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('An error occurred')));
//       }
//     }
//   }
//
//   Future<http.Response> sendLoginRequest() async {
//     final url = Uri.parse('https://cripx.provisioningtech.com/post_ajax/create_account');
//     final response = await http.post(
//       url,
//       headers: {
//         'Client-Service': 'frontend-client',
//         'Auth-Key': 'simplerestapi',
//       },
//       body: {
//         'phone': mobileNumber,
//         'password': passwordController.text,
//         'token': 'yourTokenHere',
//       },
//     );
//
//     if (response.statusCode == 200) {
//       return response;
//     } else {
//       print('Login failed with status code ${response.statusCode}');
//       print('Response body: ${response.body}');
//       throw Exception('Login failed with status code ${response.statusCode}');
//     }
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
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:betting_app/app_homescreen.dart';

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
  String mobileNumber = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loadMobileNumber();
  }

  void loadMobileNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mobileNumber = prefs.getString('mobileNumber') ?? '';
      print('Mobile Number loaded from SharedPreferences: $mobileNumber');
    });
  }

  bool isAlphanumeric(String value) {
    final alphanumericRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    return alphanumericRegex.hasMatch(value);
  }

  void CreateAccountApi() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await sendLoginRequest();

        print('Response status code: ${response.statusCode}'); // Print the response code

        if (response.statusCode == 200) {
          print('Mobile Number: $mobileNumber');
          final body = jsonDecode(response.body);
          // print('Response status code: ${response.statusCode}');
          print('Response body: ${response.body}'); // Print the response status code and body

          print('Login successful');
          // You can add navigation to the next screen here if needed.

          // Add the navigation logic here when the status code is 200
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()), // Replace with your next page
          );
        } else {
          print('Login failed with status code ${response.statusCode}');
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Login failed')));
        }
      } catch (e) {
        print('Login failed with exception: $e');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('An error occurred')));
      }
    }
  }

  Future<http.Response> sendLoginRequest() async {
    final url = Uri.parse('https://cripx.provisioningtech.com/post_ajax/create_account');

    // Remove the country code from the mobile number
    final sanitizedMobileNumber = mobileNumber.replaceAll('+91', '');

    final response = await http.post(
        url,
        headers: {
          'Client-Service': 'frontend-client',
          'Auth-Key': 'simplerestapi',
        },
        body: {
          'phone': sanitizedMobileNumber,
          'password': passwordController.text,
          'token': 'yourTokenHere',
        });

    if (response.statusCode == 200) {
      return response;
    } else {
      print('Login failed with status code ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Login failed with status code ${response.statusCode}');
    }
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
              Text('Mobile Number: $mobileNumber'),
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
                onPressed: CreateAccountApi,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
