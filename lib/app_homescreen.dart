// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApps());
// }
//
// class MyApps extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//
//   void changeSelected(int index) {
//     setState(() {
//       _selectedIndex = index;
//
//
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text('CRIPX '),
//         ),
//         backgroundColor: Colors.cyan,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Container(
//                 height: 90,
//                 width: double.infinity,
//                 child: Card(
//                   shadowColor: Colors.black,
//                   shape: RoundedRectangleBorder(
//                     side: BorderSide(
//                       color: Color.fromARGB(255, 230, 190, 16),
//                       width: 2,
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.account_circle,
//                             ),
//                             SizedBox(
//                               width: 2,
//                             ),
//                             Text(
//                               'USERNAME:',
//                               style:
//                               TextStyle(fontSize: 10, color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.edit,
//                             ),
//                             SizedBox(
//                               width: 2,
//                             ),
//                             Text(
//                               'REGISTRATION DATE:',
//                               style:
//                               TextStyle(fontSize: 10, color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.mobile_friendly,
//                             ),
//                             Text(
//                               'LAST ACCESS:',
//                               style:
//                               TextStyle(fontSize: 10, color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//
//                 onPressed: () {
//                   // Add your logic to handle the 'Done' button click here.
//                   // You can use the 'buttonStates' list to determine which buttons were selected.
//                   Navigator.pushNamed(context, 'game');
//                   print('Game Screen ');
//                 },
//                 child: Text('Play Game :', style: TextStyle(fontSize: 30),),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Column(
//                 children: [
//                   Container(
//                     color: Color(0xFF050444),
//                     height: 120,
//                     width: 350,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           height: 110,
//                           width: 90,
//                           child: Icon(
//                             Icons.currency_rupee,
//                             size: 80,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//
//                             Text(
//                               'ACCOUNT BALANCE',
//                               style:
//                               TextStyle(color: Colors.white, fontSize: 16),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "\₹",
//                                   style: TextStyle(
//                                     color: Color.fromARGB(255, 230, 190, 16),
//                                     fontSize: 30,
//                                   ),
//                                 ),
//                                 Text(
//                                   "10.00",
//                                   style: TextStyle(
//                                       color: Color.fromARGB(255, 230, 190, 16),
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.w900),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     color: Color.fromARGB(255, 230, 190, 16),
//                     height: 90,
//                     width: 350,
//                     child: Card(
//                       margin: EdgeInsets.only(
//                           left: 80, right: 80, bottom: 22, top: 22),
//                       color: Color.fromARGB(255, 230, 190, 16),
//                       shape: RoundedRectangleBorder(side: BorderSide(width: 2)),
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, 'topup');
//                           print('Recharge Screen');
//                         },
//                         child: Text(
//                           'REQUEST PAYMENT',
//                           style: TextStyle(color: Colors.black, fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     color: Color(0xFF050444),
//                     height: 120,
//                     width: 350,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           height: 110,
//                           width: 90,
//                           child: Icon(
//                             Icons.account_balance_wallet_outlined,
//                             size: 80,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               'EARNED TOTAL',
//                               style:
//                               TextStyle(color: Colors.white, fontSize: 16),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "\₹",
//                                   style: TextStyle(
//                                     color: Color.fromARGB(255, 230, 190, 16),
//                                     fontSize: 30,
//                                   ),
//                                 ),
//                                 Text(
//                                   "5.00",
//                                   style: TextStyle(
//                                       color: Color.fromARGB(255, 230, 190, 16),
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.w900),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     color: Color.fromARGB(255, 230, 190, 16),
//                     height: 90,
//                     width: 350,
//                     child: Card(
//                       margin: EdgeInsets.only(
//                           left: 80, right: 80, bottom: 22, top: 22),
//                       color: Color.fromARGB(255, 230, 190, 16),
//                       shape: RoundedRectangleBorder(side: BorderSide(width: 2)),
//                       child: TextButton(
//                         onPressed: () {
//                           // Navigator.pushNamed(context, 'transaction');
//                           Navigator.pushNamed(context, 'withdraw');
//                           print('Withdraw Screen');
//                         },
//                         child: Text(
//                           'MAKE A DEPOSIT',
//                           style: TextStyle(color: Colors.black, fontSize: 20),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     color: Color(0xFF050444),
//                     height: 120,
//                     width: 350,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           height: 110,
//                           width: 90,
//                           child: Icon(
//                             Icons.savings_outlined,
//                             size: 90,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               'ACTIVE DEPOSIT',
//                               style:
//                               TextStyle(color: Colors.white, fontSize: 16),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "\₹",
//                                   style: TextStyle(
//                                     color: Color.fromARGB(255, 230, 190, 16),
//                                     fontSize: 30,
//                                   ),
//                                 ),
//                                 Text(
//                                   "5.00",
//                                   style: TextStyle(
//                                       color: Color.fromARGB(255, 230, 190, 16),
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.w900),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     color: Color.fromARGB(255, 230, 190, 16),
//                     height: 90,
//                     width: 350,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Card(
//                           color: Color.fromARGB(255, 230, 190, 16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('Last Deposit:'),
//                               Text('\₹50.00'),
//                             ],
//                           ),
//                         ),
//                         Card(
//                           color: Color.fromARGB(255, 230, 190, 16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Total Deposit:',
//                               ),
//                               Text(
//                                 '\₹50.00',
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     color: Color(0xFF050444),
//                     height: 120,
//                     width: 350,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           height: 110,
//                           width: 90,
//                           child: Icon(
//                             Icons.monetization_on_outlined,
//                             size: 90,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               'TOTAL WITHDRAWAL',
//                               style:
//                               TextStyle(color: Colors.white, fontSize: 14),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "\₹",
//                                   style: TextStyle(
//                                     color: Color.fromARGB(255, 230, 190, 16),
//                                     fontSize: 30,
//                                   ),
//                                 ),
//                                 Text(
//                                   "5.00",
//                                   style: TextStyle(
//                                       color: Color.fromARGB(255, 230, 190, 16),
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.w900),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     color: Color.fromARGB(255, 230, 190, 16),
//                     height: 90,
//                     width: 350,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Card(
//                           color: Color.fromARGB(255, 230, 190, 16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('Last Withdrawal:'),
//                               Text('\₹5.00'),
//                             ],
//                           ),
//                         ),
//                         Card(
//                           color: Color.fromARGB(255, 230, 190, 16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Pending Withdrawal:',
//                               ),
//                               Text(
//                                 '\₹00.00',
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//             ],
//           ),
//         ),
//       ),
//
//       // Drawer Code
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Container(
//                 child: Image.asset(
//                   "assets/images/logo.jpg",
//                   height: 200,
//                   width: 200,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Container(
//                 child: ListTile(
//                   selected: _selectedIndex == 0,
//                   leading: Icon(
//                     Icons.account_box_outlined,
//                     size: 25,
//                     color: Color.fromARGB(255, 0, 0, 0),
//                   ),
//                   title: Text(
//                     "ACCOUNT",
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w800,
//                       fontFamily: "NotoSerifDevanagari",
//                     ),
//                   ),
//                   onTap: () {
//                     changeSelected(0);
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Container(
//                 // decoration: BoxDecoration(
//                 //     color: Colors.white,
//                 //     border: Border.all(color: Colors.deepPurple, width: 5)),
//                 child: ListTile(
//                   selected: _selectedIndex == 1,
//                   leading: Icon(
//                     Icons.business_center_outlined,
//                     size: 25,
//                     color: Colors.black,
//                   ),
//                   title: Text(
//                     "DEPOSITE",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "NotoSerifDevanagari"),
//                   ),
//                   onTap: () {
//                     changeSelected(1);
//                     Navigator.pushNamed(context, 'topup');
//                     print('Recharge Screen');
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Container(
//                 // decoration: BoxDecoration(
//                 //     color: Colors.white,
//                 //     border: Border.all(color: Colors.deepPurple, width: 5)),
//                 child: ListTile(
//                   selected: _selectedIndex == 2,
//                   leading: Icon(
//                     Icons.money_off_sharp,
//                     size: 25,
//                     color: Colors.black,
//                   ),
//                   title: Text(
//                     "WITHDRAW",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "NotoSerifDevanagari"),
//                   ),
//                   onTap: () {
//                     changeSelected(2);
//                     Navigator.pushNamed(context, 'withdraw');
//                     print('Withdraw Screen');
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Container(
//                 // decoration: BoxDecoration(
//                 //     color: Colors.white,
//                 //     border: Border.all(color: Colors.deepPurple, width: 5)),
//                 child: ListTile(
//                   selected: _selectedIndex == 3,
//                   leading: Icon(
//                     Icons.account_balance,
//                     size: 25,
//                     color: Colors.black,
//                   ),
//                   title: Text(
//                     "YOUR DEPOSITS",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "NotoSerifDevanagari"),
//                   ),
//                   onTap: () {
//                     changeSelected(3);
//                     Navigator.pushNamed(context, 'transaction');
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Container(
//                 // decoration: BoxDecoration(
//                 //     color: Colors.white,
//                 //     border: Border.all(color: Colors.deepPurple, width: 5)),
//                 child: ListTile(
//                   selected: _selectedIndex == 4,
//                   leading: Icon(
//                     Icons.payment_outlined,
//                     size: 25,
//                     color: Colors.black,
//                   ),
//                   title: Text(
//                     "TRANSACTION",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "NotoSerifDevanagari"),
//                   ),
//                   onTap: () {
//                     changeSelected(4);
//                     // Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Container(
//                 // decoration: BoxDecoration(
//                 //     color: Colors.white,
//                 //     border: Border.all(color: Colors.deepPurple, width: 5)),
//                 child: ListTile(
//                   selected: _selectedIndex == 5,
//                   leading: Icon(
//                     Icons.share_sharp,
//                     size: 25,
//                     color: Colors.black,
//                   ),
//                   title: Text(
//                     "REFFERAL",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "NotoSerifDevanagari"),
//                   ),
//                   onTap: () {
//                     changeSelected(5);
//                     // Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Container(
//                 // decoration: BoxDecoration(
//                 //     color: Colors.white,
//                 //     border: Border.all(color: Colors.deepPurple, width: 5)),
//                 child: ListTile(
//                   selected: _selectedIndex == 6,
//                   leading: Icon(
//                     Icons.settings,
//                     size: 25,
//                     color: Colors.black,
//                   ),
//                   title: Text(
//                     "SETTINGS",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "NotoSerifDevanagari"),
//                   ),
//                   onTap: () {
//                     changeSelected(6);
//                     // Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Container(
//                 // decoration: BoxDecoration(
//                 //     color: Colors.white,
//                 //     border: Border.all(color: Colors.deepPurple, width: 5)),
//                 child: ListTile(
//                   selected: _selectedIndex == 6,
//                   leading: Icon(
//                     Icons.security,
//                     size: 25,
//                     color: Colors.black,
//                   ),
//                   title: Text(
//                     "SECURITY",
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "NotoSerifDevanagari"),
//                   ),
//                   onTap: () {
//                     changeSelected(6);
//                     // Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//
//     );
//   }
// }

import 'package:betting_app/bank_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void changeSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to build drawer items
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required int selectedIndex,
    required int itemIndex,
    required Function onTap,
  }) {
    final isSelected = selectedIndex == itemIndex;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.pink,
      ),
      child: Container(
        child: Column(
          children: [
            Divider( // Divider line before the item
              color: Colors.white, // You can customize the color here
              thickness: 0, // You can customize the thickness here
            ),
            ListTile(
              selected: isSelected,
              leading: Container(
                child: Icon(
                  icon,
                  size: 25,
                  color: isSelected ? Colors.white : Colors.white, // Icon color
                ),
              ),
              title: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "NotoSerifDevanagari",
                  color: isSelected ? Colors.white : Colors.white, // Text color
                ),
              ),
              onTap: () => onTap(),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
                color: isSelected ? Colors.white : Colors.white, // Arrow button color
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('CRIPX '),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                child: Card(
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromARGB(255, 230, 190, 16),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'USERNAME:',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'REGISTRATION DATE:',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.mobile_friendly,
                            ),
                            Text(
                              'LAST ACCESS:',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your logic to handle the 'Done' button click here.
                  // You can use the 'buttonStates' list to determine which buttons were selected.
                  Navigator.pushNamed(context, 'game');
                  print('Game Screen ');
                },
                child: Text(
                  'Play Game :',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    color: Color(0xFF050444),
                    height: 120,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 110,
                          width: 90,
                          child: Icon(
                            Icons.currency_rupee,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'ACCOUNT BALANCE',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\₹",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 230, 190, 16),
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "10.00",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 230, 190, 16),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 230, 190, 16),
                    height: 90,
                    width: 350,
                    child: Card(
                      margin: EdgeInsets.only(
                          left: 80, right: 80, bottom: 22, top: 22),
                      color: Color.fromARGB(255, 230, 190, 16),
                      shape: RoundedRectangleBorder(side: BorderSide(width: 2)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'topup');
                          print('Recharge Screen');
                        },
                        child: Text(
                          'REQUEST PAYMENT',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Color(0xFF050444),
                    height: 120,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 110,
                          width: 90,
                          child: Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'EARNED TOTAL',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\₹",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 230, 190, 16),
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "5.00",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 230, 190, 16),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 230, 190, 16),
                    height: 90,
                    width: 350,
                    child: Card(
                      margin: EdgeInsets.only(
                          left: 80, right: 80, bottom: 22, top: 22),
                      color: Color.fromARGB(255, 230, 190, 16),
                      shape: RoundedRectangleBorder(side: BorderSide(width: 2)),
                      child: TextButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, 'transaction');
                          Navigator.pushNamed(context, 'withdraw');
                          print('Withdraw Screen');
                        },
                        child: Text(
                          'MAKE A DEPOSIT',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Color(0xFF050444),
                    height: 120,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 110,
                          width: 90,
                          child: Icon(
                            Icons.savings_outlined,
                            size: 90,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'ACTIVE DEPOSIT',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\₹",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 230, 190, 16),
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "5.00",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 230, 190, 16),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 230, 190, 16),
                    height: 90,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          color: Color.fromARGB(255, 230, 190, 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Last Deposit:'),
                              Text('\₹50.00'),
                            ],
                          ),
                        ),
                        Card(
                          color: Color.fromARGB(255, 230, 190, 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Deposit:',
                              ),
                              Text(
                                '\₹50.00',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Color(0xFF050444),
                    height: 120,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 110,
                          width: 90,
                          child: Icon(
                            Icons.monetization_on_outlined,
                            size: 90,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'TOTAL WITHDRAWAL',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\₹",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 230, 190, 16),
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "5.00",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 230, 190, 16),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 230, 190, 16),
                    height: 90,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          color: Color.fromARGB(255, 230, 190, 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Last Withdrawal:'),
                              Text('\₹5.00'),
                            ],
                          ),
                        ),
                        Card(
                          color: Color.fromARGB(255, 230, 190, 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pending Withdrawal:',
                              ),
                              Text(
                                '\₹00.00',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),

      // Drawer Code
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Container(
      //           child: Image.asset(
      //             "assets/images/logo.jpg",
      //             height: 200,
      //             width: 200,
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: Container(
      //           child: ListTile(
      //             selected: _selectedIndex == 0,
      //             leading: Icon(
      //               Icons.account_box_outlined,
      //               size: 25,
      //               color: Color.fromARGB(255, 0, 0, 0),
      //             ),
      //             title: Text(
      //               "ACCOUNT",
      //               style: TextStyle(
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w800,
      //                 fontFamily: "NotoSerifDevanagari",
      //               ),
      //             ),
      //             onTap: () {
      //               changeSelected(0);
      //               Navigator.pop(context);
      //             },
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: Container(
      //           // decoration: BoxDecoration(
      //           //     color: Colors.white,
      //           //     border: Border.all(color: Colors.deepPurple, width: 5)),
      //           child: ListTile(
      //             selected: _selectedIndex == 1,
      //             leading: Icon(
      //               Icons.business_center_outlined,
      //               size: 25,
      //               color: Colors.black,
      //             ),
      //             title: Text(
      //               "DEPOSITE",
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   fontWeight: FontWeight.bold,
      //                   fontFamily: "NotoSerifDevanagari"),
      //             ),
      //             onTap: () {
      //               changeSelected(1);
      //               Navigator.pushNamed(context, 'topup');
      //               print('Recharge Screen');
      //             },
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: Container(
      //           // decoration: BoxDecoration(
      //           //     color: Colors.white,
      //           //     border: Border.all(color: Colors.deepPurple, width: 5)),
      //           child: ListTile(
      //             selected: _selectedIndex == 2,
      //             leading: Icon(
      //               Icons.money_off_sharp,
      //               size: 25,
      //               color: Colors.black,
      //             ),
      //             title: Text(
      //               "WITHDRAW",
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   fontWeight: FontWeight.bold,
      //                   fontFamily: "NotoSerifDevanagari"),
      //             ),
      //             onTap: () {
      //               changeSelected(2);
      //               Navigator.pushNamed(context, 'withdraw');
      //               print('Withdraw Screen');
      //             },
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: Container(
      //           // decoration: BoxDecoration(
      //           //     color: Colors.white,
      //           //     border: Border.all(color: Colors.deepPurple, width: 5)),
      //           child: ListTile(
      //             selected: _selectedIndex == 3,
      //             leading: Icon(
      //               Icons.account_balance,
      //               size: 25,
      //               color: Colors.black,
      //             ),
      //             title: Text(
      //               "YOUR DEPOSITS",
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   fontWeight: FontWeight.bold,
      //                   fontFamily: "NotoSerifDevanagari"),
      //             ),
      //             onTap: () {
      //               changeSelected(3);
      //               Navigator.pushNamed(context, 'transaction');
      //             },
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: Container(
      //           // decoration: BoxDecoration(
      //           //     color: Colors.white,
      //           //     border: Border.all(color: Colors.deepPurple, width: 5)),
      //           child: ListTile(
      //             selected: _selectedIndex == 4,
      //             leading: Icon(
      //               Icons.payment_outlined,
      //               size: 25,
      //               color: Colors.black,
      //             ),
      //             title: Text(
      //               "TRANSACTION",
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   fontWeight: FontWeight.bold,
      //                   fontFamily: "NotoSerifDevanagari"),
      //             ),
      //             onTap: () {
      //               changeSelected(4);
      //               // Navigator.pop(context);
      //             },
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: Container(
      //           // decoration: BoxDecoration(
      //           //     color: Colors.white,
      //           //     border: Border.all(color: Colors.deepPurple, width: 5)),
      //           child: ListTile(
      //             selected: _selectedIndex == 5,
      //             leading: Icon(
      //               Icons.share_sharp,
      //               size: 25,
      //               color: Colors.black,
      //             ),
      //             title: Text(
      //               "REFFERAL",
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   fontWeight: FontWeight.bold,
      //                   fontFamily: "NotoSerifDevanagari"),
      //             ),
      //             onTap: () {
      //               changeSelected(5);
      //               // Navigator.pop(context);
      //             },
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: Container(
      //           // decoration: BoxDecoration(
      //           //     color: Colors.white,
      //           //     border: Border.all(color: Colors.deepPurple, width: 5)),
      //           child: ListTile(
      //             selected: _selectedIndex == 6,
      //             leading: Icon(
      //               Icons.settings,
      //               size: 25,
      //               color: Colors.black,
      //             ),
      //             title: Text(
      //               "SETTINGS",
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   fontWeight: FontWeight.bold,
      //                   fontFamily: "NotoSerifDevanagari"),
      //             ),
      //             onTap: () {
      //               changeSelected(6);
      //               // Navigator.pop(context);
      //             },
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: Container(
      //           // decoration: BoxDecoration(
      //           //     color: Colors.white,
      //           //     border: Border.all(color: Colors.deepPurple, width: 5)),
      //           child: ListTile(
      //             selected: _selectedIndex == 6,
      //             leading: Icon(
      //               Icons.security,
      //               size: 25,
      //               color: Colors.black,
      //             ),
      //             title: Text(
      //               "SECURITY",
      //               style: TextStyle(
      //                   fontSize: 15,
      //                   fontWeight: FontWeight.bold,
      //                   fontFamily: "NotoSerifDevanagari"),
      //             ),
      //             onTap: () {
      //               changeSelected(6);
      //               // Navigator.pop(context);
      //             },
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
// Updated Drawer Code
      drawer: Drawer(
        child: Container(
          color: Color(0xFF040420),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  child: Image.asset(
                    "assets/images/logo.jpg",
                    height: 200,
                    width: 200,
                    color: Colors.white,
                  ),
                ),
              ),
              _buildDrawerItem(
                icon: Icons.person,
                text: "ACCOUNT",
                selectedIndex: _selectedIndex,
                itemIndex: 0,
                onTap: () {
                  changeSelected(0);
                  Navigator.pop(context);
                },
              ),
              _buildDrawerItem(
                icon: Icons.business_center_outlined,
                text: "DEPOSIT",
                selectedIndex: _selectedIndex,
                itemIndex: 1,
                onTap: () {
                  changeSelected(1);
                  Navigator.pushNamed(context, 'topup');
                  print('Recharge Screen');
                },
              ),
              _buildDrawerItem(
                icon: Icons.money_off_sharp,
                text: "WITHDRAW",
                selectedIndex: _selectedIndex,
                itemIndex: 2,
                onTap: () {
                  changeSelected(2);
                  Navigator.pushNamed(context, 'withdraw');
                  print('Withdraw Screen');
                },
              ),
              _buildDrawerItem(
                icon: Icons.manage_history,
                text: "YOUR DEPOSITS",
                selectedIndex: _selectedIndex,
                itemIndex: 3,
                onTap: () {
                  changeSelected(3);
                  Navigator.pushNamed(context, 'transaction');
                },
              ),
              _buildDrawerItem(
                icon: Icons.account_balance,
                text: "BANK DETAILS",
                selectedIndex: _selectedIndex,
                itemIndex: 4,
                onTap: () {
                  changeSelected(4);
                  print('Clicked Bank Details');
                  Navigator.pushNamed(context, 'bankdetails');
                },
              ),
              _buildDrawerItem(
                icon: Icons.work_history_outlined,
                text: "WITHDRAWAL HISTORY",
                selectedIndex: _selectedIndex,
                itemIndex: 5,
                onTap: () {
                  changeSelected(5);
                  print('Clicked withdrawal History');
                  Navigator.pushNamed(context, 'history');
                },
              ),
              _buildDrawerItem(
                icon: Icons.share_outlined,
                text: "REFERRAl",
                selectedIndex: _selectedIndex,
                itemIndex: 6,
                onTap: () {
                  changeSelected(6);
                  print('Clicked Referral');
                  Navigator.pushNamed(context, 'referral');
                },
              ),
              _buildDrawerItem(
                icon: Icons.corporate_fare,
                text: "ABOUT US",
                selectedIndex: _selectedIndex,
                itemIndex: 7,
                onTap: () {
                  changeSelected(8);
                  print('Clicked About Us');
                  // Navigator.pushNamed(context, 'transaction');
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle recharge with a good luck message
                  Navigator.pushNamed(context, 'home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color(0xFF040420),
                  maximumSize: Size(80, 60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Sign out', style: TextStyle(fontSize: 22, color: Colors.pink)),
                    SizedBox(width: 40),
                    Icon(
                      color: Colors.pink,
                      Icons.arrow_back_outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Add more drawer items as need
    );
  }
}
