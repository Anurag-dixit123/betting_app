// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AddMoneyScreen(),
//     );
//   }
// }
//
// class AddMoneyScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Money'),
//       ),
//       body: Stack(
//         children: <Widget>[
//           // Background Image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/addmoney.png'),
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   'Current Balance: \$100.00',
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     ElevatedButton(
//                       onPressed: () {
//                         // Add $10
//                         // Implement the logic to add $10 here
//                       },
//                       style: ElevatedButton.styleFrom(primary: Colors.green),
//                       child: Text('\$10', style: TextStyle(fontSize: 18)),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Add $20
//                         // Implement the logic to add $20 here
//                       },
//                       style: ElevatedButton.styleFrom(primary: Colors.blue),
//                       child: Text('\$20', style: TextStyle(fontSize: 18)),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Add $30
//                         // Implement the logic to add $30 here
//                       },
//                       style: ElevatedButton.styleFrom(primary: Colors.orange),
//                       child: Text('\$30', style: TextStyle(fontSize: 18)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: 'Enter Amount to Add',
//                     prefixText: '\$',
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Custom amount input
//                     // Implement the logic to add the custom amount here
//                   },
//                   style: ElevatedButton.styleFrom(primary: Colors.red),
//                   child: Text('Add Custom Amount', style: TextStyle(fontSize: 18)),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AddMoneyScreen(),
//     );
//   }
// }
//
// class AddMoneyScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Recharge', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),)),
//         backgroundColor: Color(0xFF030433), // Set the app bar background color
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Handle back button press here
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.history),
//             onPressed: () {
//               // Handle "Recharge History" button press here
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: Color(0xFF030433),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 22, right: 12, left: 12),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 // Blue Container with Current Balance
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           // Text(
//                           //   'Current Balance',
//                           //   style: TextStyle(
//                           //     color: Colors.white,
//                           //     fontSize: 20.0,
//                           //   ),
//                           // ),
//                           // SizedBox(width: 20,),
//                           Text(
//                             ' ₹',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 30.0,
//                             ),
//                           ),
//                           Text(
//                             ' 100.00',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 45.0,
//                               // fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       // Text below the blue container
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 45.0),
//                             child: Text(
//                               'Your balance is being protected at bank level so invest with confidence',
//                               style:
//                                   TextStyle(fontSize: 16.0, color: Colors.white),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: 20),
//                 // Text "Recharge Amount"
//                 Padding(
//                   padding: const EdgeInsets.only(right: 230),
//                   child: Text(
//                     'Recharge Amount',
//                     style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // Recharge Amount Buttons with three buttons per row
//                 Column(
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle $10 recharge
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Color(0xFF030430),
//                             minimumSize: Size(100, 50),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)
//                             ),
//                             elevation: 3, // Adjust the elevation (shadow depth) as needed
//                             shadowColor: Colors.white, // Adjust the shadow color as needed
//                           ),
//                           child: Text('  ₹ 10', style: TextStyle(fontSize: 18)),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle $20 recharge
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             minimumSize: Size(100, 50),
//                           ),
//                           child: Text(' ₹ 20', style: TextStyle(fontSize: 18)),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle $30 recharge
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.orange,
//                             minimumSize: Size(100, 50),
//                           ),
//                           child: Text(' ₹ 30', style: TextStyle(fontSize: 18)),
//                         ),
//                       ],
//                     ),
//
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle recharge with a good luck message
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pinkAccent,
//                     minimumSize: Size(300, 60),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text('Recharge', style: TextStyle(fontSize: 22)),
//                       SizedBox(width: 10),
//                       Text('👍', style: TextStyle(fontSize: 24)),
//                     ],
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


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WithdrawMoneyScreen(),
    );
  }
}

class WithdrawMoneyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Withdraw Balance',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        backgroundColor: Color(0xFF030417),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press here
            Navigator.pushNamed(context, 'app');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              // Handle "Recharge History" button press here
              Navigator.pushNamed(context, 'history');
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF040410),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 22, right: 12, left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Blue Container with Current Balance
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            ' ₹',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                            ),
                          ),
                          Text(
                            ' 140.00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Text(
                            'Your withdrawal balance will be credited in your bank account within 1 working hour... ',
                            style:
                            TextStyle(fontSize: 16.0, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 240),
                  child: Text(
                    'Withdrawal Amount',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF010410),
                        // borderRadius: BorderRadius.circular(2.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.4),
                            spreadRadius: 12,
                            blurRadius: 19,
                            offset: Offset(2, 8,),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Enter Withdrawal Amount  : ',
                            style: TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Center(
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                inputDecorationTheme: InputDecorationTheme(
                                  labelStyle: TextStyle(color: Colors.white), //
                                  // Change label text color to white
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black), // Change border color to white
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white), // Change border color to white
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: 'Click Here',
                                  prefixText: ' ₹ ',
                                  prefixStyle: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle recharge with a good luck message
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        minimumSize: Size(300, 60),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Withdraw', style: TextStyle(fontSize: 22)),
                          SizedBox(width: 10),
                          // Text('👍', style: TextStyle(fontSize: 24)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
