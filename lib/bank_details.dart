// import 'package:flutter/material.dart';
//
// void main() => runApp(Bank());
//
// class Bank extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BankDetails(),
//     );
//   }
// }
//
// class BankDetails extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF030430),
//         title: Center(child: Text('Bank Details')),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Handle back button press here
//             Navigator.pushNamed(context, 'app');
//           },
//         ),
//       ),
//       body: Container(
//         color:  Color(0xFF030230),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 4),
//           child: Container(
//             color:  Color(0xFF030230),
//             height: double.infinity,
//             width: double.infinity,
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Name', style: TextStyle(color: Colors.white, fontSize: 18),),
//                       Container(
//                         height: 50,
//                         width: 130,
//                         child: TextFormField(
//                           style: TextStyle(
//                             color: Colors.white, // Set the color of the input text
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Please enter',
//                             hintStyle: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//
//                 Divider(color: Colors.white), // Divider 1
//
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8, left: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Bank Name', style: TextStyle(color: Colors.white, fontSize: 18),),
//                       Container(
//                         height: 50,
//                         width: 130,
//                         child: TextFormField(
//                           style: TextStyle(
//                             color: Colors.white, // Set the color of the input text
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Please enter',
//                             hintStyle: TextStyle(color: Colors.white),
//                             prefixStyle: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Divider(color: Colors.white), // Divider 2
//
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8, left: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Account Number', style: TextStyle(color: Colors.white, fontSize: 18),),
//                       Container(
//                         height: 50,
//                         width: 130,
//                         child: TextFormField(
//                           keyboardType: TextInputType.phone,
//                           style: TextStyle(
//                             color: Colors.white, // Set the color of the input text
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Please enter',
//                             hintStyle: TextStyle(color: Colors.white),
//                             prefixStyle: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Divider(color: Colors.white), // Divider 3
//
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8, left: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('IFSC Number', style: TextStyle(color: Colors.white, fontSize: 18),),
//                       Container(
//                         height: 50,
//                         width: 130,
//                         child: TextFormField(
//                           style: TextStyle(
//                             color: Colors.white, // Set the color of the input text
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Please enter',
//                             hintStyle: TextStyle(color: Colors.white),
//                             prefixStyle: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Divider(color: Colors.white), // Divider 4
//
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8, left: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Mobile Number', style: TextStyle(color: Colors.white, fontSize: 18),),
//                       Container(
//                         height: 50,
//                         width: 130,
//                         child: TextFormField(
//                           keyboardType: TextInputType.phone,
//                           style: TextStyle(
//                             color: Colors.white, // Set the color of the input text
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Please enter',
//                             hintStyle: TextStyle(color: Colors.white),
//                             prefixStyle: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Divider(color: Colors.white), // Divider 5
//
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8, left: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Email', style: TextStyle(color: Colors.white, fontSize: 18),),
//                       Container(
//                         height: 50,
//                         width: 130,
//                         child: TextFormField(
//                           style: TextStyle(
//                             color: Colors.white, // Set the color of the input text
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Please enter',
//                             hintStyle: TextStyle(color: Colors.white),
//                             prefixStyle: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Divider(color: Colors.white), // Divider 6
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     children: [
//                       Text('Please check the information carefully', style: TextStyle(color: Colors.red, fontSize: 15),),
//                       Text('incorrect information will not receive withdrawals.',style: TextStyle(color: Colors.red, fontSize: 15),),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       )
//     );
//   }
// }

import 'package:betting_app/app_homescreen.dart';
import 'package:flutter/material.dart';

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
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: Container(
                      // color: Colors.white,
                      // color: Color(0xFF030452),
                      height: 60,
                      width: 370,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, 'app');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage()), // Create an instance of MyScreen
                          );
                          print('Data Saved');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF030452), // Pink invite button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        child: Text(
                          'Submit',
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
