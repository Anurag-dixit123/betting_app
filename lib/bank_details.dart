import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:betting_app/app_homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(Bank());

class Bank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BankDetails(),
    );
  }
}

class BankDetails extends StatefulWidget {
  @override
  _BankDetailsState createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController holderNameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  // API Validation
  void BankDetailsApi(BuildContext context) async {
    if (nameController.text.isNotEmpty && holderNameController.text.isNotEmpty && bankNameController.text.isNotEmpty
    && accountNumberController.text.isNotEmpty && ifscNumberController.text.isNotEmpty && emailController.text.isNotEmpty
    ) {
      print('Sending login request...');

      var response = await http.post(
        Uri.parse('https://cripx.provisioningtech.com/post_ajax/verify_account'),
        headers: {
          'Client-Service': 'frontend-client',
          'Auth-Key': 'simplerestapi',
          'Authorization': '97kxVXV6Nk45M',
          'type': '2',
          'User-ID': '1',
        },
        body: {
          // 'name': 'anurag',
          // 'holder_name': 'anurag',
          // 'account_no': '7996001700017779',
          // 'ifsc': 'PUNB0799600',
          // 'email': 'abhidixit9536@gmail.com',
          // 'loginid': '1'
          'name': nameController.text,
          'holder_name': holderNameController.text,
          'account_no': accountNumberController.text,
          'ifsc': ifscNumberController.text,
          'email': emailController.text,
          'loginid': '1'

        },
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}'); // Print the response status code and body

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Blank Value')));
    }
  }


  @override
  void initState() {
    super.initState();

    // Retrieve the saved mobile number from shared preferences and set it to the controller
    retrieveMobileNumber();
  }

  // Function to retrieve the saved mobile number from shared preferences
  void retrieveMobileNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedMobileNumber = prefs.getString('mobileNumber');
    if (savedMobileNumber != null) {
      setState(() {
        mobileNumberController.text = savedMobileNumber;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF030430),
        title: Center(child: Text('Bank Details')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ); // Create an instance of MyScreen
          },
        ),
      ),
      resizeToAvoidBottomInset: false, // Set this property to true
      body: Container(
        color: Color(0xFF030230),
        child: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Container(
            color: Color(0xFF030230),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Container(
                          height: 50,
                          width: 130,
                          child: TextFormField(
                            controller: nameController,
                            style: TextStyle(
                              color: Colors
                                  .white, // Set the color of the input text
                            ),
                            decoration: InputDecoration(
                              hintText: 'Please enter',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.white), // Divider 1

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Acc. Holder Name',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Container(
                          height: 50,
                          width: 130,
                          child: TextFormField(
                            controller: holderNameController,
                            style: TextStyle(
                              color: Colors
                                  .white, // Set the color of the input text
                            ),
                            decoration: InputDecoration(
                              hintText: 'Please enter',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.white), // Divider 1

                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bank Name',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Container(
                          height: 50,
                          width: 130,
                          child: TextFormField(
                            controller: bankNameController,
                            style: TextStyle(
                              color: Colors
                                  .white, // Set the color of the input text
                            ),
                            decoration: InputDecoration(
                              hintText: 'Please enter',
                              hintStyle: TextStyle(color: Colors.white),
                              prefixStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.white), // Divider 2

                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Account Number',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Container(
                          height: 50,
                          width: 130,
                          child: TextFormField(
                            controller: accountNumberController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              color: Colors
                                  .white, // Set the color of the input text
                            ),
                            decoration: InputDecoration(
                              hintText: 'Please enter',
                              hintStyle: TextStyle(color: Colors.white),
                              prefixStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.white), // Divider 3

                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'IFSC Number',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Container(
                          height: 50,
                          width: 130,
                          child: TextFormField(
                            controller: ifscNumberController,
                            style: TextStyle(
                              color: Colors
                                  .white, // Set the color of the input text
                            ),
                            decoration: InputDecoration(
                              hintText: 'Please enter',
                              hintStyle: TextStyle(color: Colors.white),
                              prefixStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.white), // Divider 4

                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mobile Number',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Container(
                          height: 50,
                          width: 130,
                          child: TextFormField(
                            controller: mobileNumberController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              color: Colors
                                  .white, // Set the color of the input text
                            ),
                            decoration: InputDecoration(
                              hintText: 'Please enter',
                              hintStyle: TextStyle(color: Colors.white),
                              prefixStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            enabled: false,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.white), // Divider 5

                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Container(
                          height: 50,
                          width: 130,
                          child: TextFormField(
                            controller: emailController,
                            style: TextStyle(
                              color: Colors
                                  .white, // Set the color of the input text
                            ),
                            decoration: InputDecoration(
                              hintText: 'Please enter',
                              hintStyle: TextStyle(color: Colors.white),
                              prefixStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.white), // Divider 6
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Please check the information carefully',
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        Text(
                          'incorrect information will not receive withdrawals.',
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Row(
                      children: [
                        Text(
                          'Payment Url:',
                          style: TextStyle(color: Colors.yellow, fontSize: 16),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'https//www.cripx.com',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: Container(
                      // color: Colors.white,
                      // color: Color(0xFF030452),
                      height: 60,
                      width: 370,
                      child: ElevatedButton(
                        onPressed: () async {
                          BankDetailsApi(context); // Wait for the login function to complete

                          // // Navigator.pushNamed(context, 'app');
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           HomePage()), // Create an instance of MyScreen
                          // );
                          print('Data Saved');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF030452), // Pink invite button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        child: Text(
                          'Update',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
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

  @override
  void dispose() {
    // Dispose of the controllers when they are no longer needed
    nameController.dispose();
    bankNameController.dispose();
    accountNumberController.dispose();
    ifscNumberController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
