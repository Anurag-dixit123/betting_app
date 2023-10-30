
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:betting_app/app_homescreen.dart';

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

  Map<String, dynamic> apiData = {}; // Store retrieved data
  bool dataRetrieved = false; // Track whether data has been retrieved

  // Add a variable to track whether the data has been updated
  bool dataUpdated = false;

  // Function to display the message and update the UI
  void displayDataUpdatedMessage() {
    setState(() {
      dataUpdated = true;
    });
  }

  // 1st API Validation
  void BankDetailsUpdateApi(BuildContext context) async {
    if (nameController.text.isNotEmpty &&
        holderNameController.text.isNotEmpty &&
        bankNameController.text.isNotEmpty &&
        accountNumberController.text.isNotEmpty &&
        ifscNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      print('Sending Data To Api...');
      // Move the code to retrieve token and user ID here
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('userId');
      String? token = prefs.getString('login');

      if (token != null && userId != null) {
        var response = await http.post(
          Uri.parse('https://cripx.provisioningtech.com/post_ajax/update_profile'),
          headers: {
            'Client-Service': 'frontend-client',
            'Auth-Key': 'simplerestapi',
            'Authorization': token, // Use the retrieved token
            'type': '2',
            'User-ID': userId, // Use the retrieved user ID
          },
          body: {
            'name': nameController.text,
            'holder_name': holderNameController.text,
            'account_no': accountNumberController.text,
            'ifsc': ifscNumberController.text,
            'email': emailController.text,
            'loginid': userId,
          },
        );

        print('API Request 1 - Response status code: ${response.statusCode}'); // Added print statement
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}'); // Print the response status code and body

        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          print('Response status code: ${response.statusCode}');
          print('Response body: ${response.body}'); // Print the response status code and body
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Token or User ID missing')));
      }
    }
    else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Blank Value')));

    }
  }

  Future<void> BankDetailsGetApi() async {
    if (nameController.text.isNotEmpty &&
        holderNameController.text.isNotEmpty &&
        bankNameController.text.isNotEmpty &&
        accountNumberController.text.isNotEmpty &&
        ifscNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('login');
      String? userId = prefs.getString('userId');

      if (token != null && userId != null) {
        var response = await http.post(
          Uri.parse('https://cripx.provisioningtech.com/post_ajax/get_profile'),
          headers: {
            'Client-Service': 'frontend-client',
            'Auth-Key': 'simplerestapi',
            'Authorization': token,
            'type': '2',
            'User-ID': userId,
          },
          body: {
            'loginid': userId,
          },
        );
        // print('API Request 1 - Response status code: ${response.statusCode}'); // Added print statement
        print('Data Received');
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);

          displayDataUpdatedMessage();
          print('Data Got');
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Token or User ID missing')));
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
    fetchApiData(); // Fetch API data when the widget is initialized
  }

  Future<void> fetchApiData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('login'); // Retrieve the token
    String? userId = prefs.getString('userId'); // Retrieve the user ID

    // Now you can use 'token' and 'userId' in your screen as needed.
    // You can store them in variables or display them directly.
    if (token != null) {
      print('Token: $token');
    }
    if (userId != null) {
      print('User ID: $userId');
    }
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
                            enabled: !dataRetrieved, // Make the field unchangeable if data has been retrieved
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
                            enabled: !dataRetrieved, // Make the field unchangeable if data has been retrieved

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
                            enabled: !dataRetrieved, // Make the field unchangeable if data has been retrieved

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
                            enabled: !dataRetrieved, // Make the field unchangeable if data has been retrieved

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
                            enabled: !dataRetrieved, // Make the field unchangeable if data has been retrieved

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
                            enabled: !dataRetrieved, // Make the field unchangeable if data has been retrieved

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
                    height: 15,
                  ),
                  // Display the message when data is updated
                  if (dataUpdated)
                    Text(
                      'Data Updated',
                      style: TextStyle(color: Colors.green, fontSize: 18),
                    ),

              Padding(
              padding: const EdgeInsets.only(right: 12, left: 12),
          child: Container(
            height: 60,
            width: 370,
            child: ElevatedButton(
              onPressed: () async {
                BankDetailsUpdateApi(context); // Wait for the BankDetailsUpdateApi function to complete
                // Call BankDetailsGetApi to retrieve data after updating
                await BankDetailsGetApi();
                // Set dataRetrieved to true and call fetchApiData to retrieve data
                // Set dataRetrieved to true
                setState(() {
                  dataRetrieved = true;
                });
                displayDataUpdatedMessage();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF030452), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Update',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
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
