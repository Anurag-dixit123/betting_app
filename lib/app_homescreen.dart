import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:betting_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  List<bool> buttonStates = List.generate(12, (index) => false);

  String? username = '';
  String? registrationDate = '';
  String? lastAccess = '';

  @override
  void initState() {
    super.initState();
    // Make the API call when the screen is loaded
    BankDetailsUpdateApi(context);
  }


  // 1st API Validation
  void BankDetailsUpdateApi(BuildContext context) async {

      print('Sending Data To Api...');
      // Move the code to retrieve token and user ID here
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('userId');
      String? token = prefs.getString('login');

      if (token != null && userId != null) {
        var response = await http.post(
          Uri.parse('https://cripx.provisioningtech.com/post_ajax/get_profile'),
          headers: {
            'Client-Service': 'frontend-client',
            'Auth-Key': 'simplerestapi',
            'Authorization': token, // Use the retrieved token
            'type': '2',
            'User-ID': userId, // Use the retrieved user ID
          },
          body: {
            'loginid': userId,
          },
        );

        print('API Request 1 - Response status code: ${response.statusCode}'); // Added print statement
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}'); // Print the response status code and body

        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          final detail = body['detail'][0];
           username = detail['BRANCH_USERNAME'];
           registrationDate = detail['BRANCH_TT'].substring(0, 10); // Extract the date part
           lastAccess = detail['BRANCH_TT'].substring(11); // Extract the time part
          // Now you can print or use these variables as needed
          print('Username: $username');
          print('Registration Date: $registrationDate');
          print('Last Access: $lastAccess');
          // Extract relevant data from the response
          setState(() {
            username = detail['BRANCH_USERNAME'];
            registrationDate = detail['BRANCH_TT'].substring(0, 10);
            lastAccess = detail['BRANCH_TT'].substring(11);
          });
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Token or User ID missing')));
      }
    }

  void toggleButtonState(int index) {
    setState(() {
      buttonStates[index] = !buttonStates[index];
    });
  }

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
    List<int> selectedNumbers = [];

    for (int i = 0; i < buttonStates.length; i++) {
      if (buttonStates[i]) {
        selectedNumbers.add(i + 1);
      }
    }
    return WillPopScope(
      onWillPop: () async {
        // Intercept the back button press here.
        return false;
      },
      child: Scaffold(
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
                  height: 114,
                  width: double.infinity,
                  child: Card(
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 230, 190, 16),
                        width: 2,
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'USERNAME:', style: TextStyle(fontSize: 11, color: Colors.black),
                                  ),
                                  SizedBox(width: 170,),
                                  Text(username!,style: TextStyle(fontSize: 10, color: Colors.black),),

                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'REGISTRATION DATE:',
                                    style:
                                        TextStyle(fontSize: 11, color: Colors.black),
                                  ),
                                  SizedBox(width: 125,),
                                  Text(registrationDate!,style: TextStyle(fontSize: 11, color: Colors.black),),
                                      ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.mobile_friendly,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'LAST ACCESS:',
                                        style:
                                            TextStyle(fontSize: 11, color: Colors.black),
                                      ),
                                      SizedBox(width: 160,),
                                      Text(lastAccess!,style: TextStyle(fontSize: 12, color: Colors.black),),
                                    ],
                                  ),

                                     ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     // Add your logic to handle the 'Done' button click here.
                //     // You can use the 'buttonStates' list to determine which buttons were selected.
                //     Navigator.pushNamed(context, 'game');
                //     print('Game Screen ');
                //   },
                //   child: Text(
                //     'Play Game :',
                //     style: TextStyle(fontSize: 30),
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),

                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          color: Color(0xFF050444),
                          height: 60,
                          width: 168,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.currency_rupee,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ), //Container For inside code
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'ACCOUNT BALANCE',
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "\₹",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 230, 190, 16),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "10.00",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 230, 190, 16),
                                            fontSize: 20,
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
                          height: 45,
                          width: 168,
                          child: Card(
                            margin: EdgeInsets.only(
                                left: 40, right: 40, bottom: 8, top: 8),
                            color: Color.fromARGB(255, 230, 190, 16),
                            shape: RoundedRectangleBorder(side: BorderSide(width: 2)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'topup');
                                print('Recharge Screen');
                              },
                              child: Text(
                                'TOP UP',
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          color: Color(0xFF050444),
                          height: 60,
                          width: 168,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.account_balance_wallet_outlined,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'EARNED TOTAL',
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "\₹",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 230, 190, 16),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "5.00",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 230, 190, 16),
                                            fontSize: 20,
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
                          height: 45,
                          width: 168,
                          child: Card(
                            margin: EdgeInsets.only(
                                left: 40, right: 30, bottom: 8, top: 8),
                            color: Color.fromARGB(255, 230, 190, 16),
                            shape: RoundedRectangleBorder(side: BorderSide(width: 2)),
                            child: TextButton(
                              onPressed: () {
                                // Navigator.pushNamed(context, 'transaction');
                                Navigator.pushNamed(context, 'withdraw');
                                print('Withdraw Screen');
                              },
                              child: Text(
                                'WITHDRAWAL',
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ), //Changes What I'm Making

                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          color: Color(0xFF050444),
                          height: 60,
                          width: 168,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.savings_outlined,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'ACTIVE DEPOSIT',
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "\₹",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 230, 190, 16),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "5.00",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 230, 190, 16),
                                            fontSize: 20,
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
                          height: 50,
                          width: 168,
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
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          color: Color(0xFF050444),
                          height: 60,
                          width: 168,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.monetization_on_outlined,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'TOTAL WITHDRAWAL',
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "\₹",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 230, 190, 16),
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "5.00",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 230, 190, 16),
                                            fontSize: 20,
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
                          height:50,
                          width: 168,
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
                                      'Pending Withdrawal:', style: TextStyle(fontSize: 10),
                                    ),
                                    Text(
                                      '\₹00.00',
                                      style: TextStyle(
                                        fontSize: 13,
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
                    )
                  ],
                ),
           SizedBox(
             height: 20,
           ),
               Container(
                 child: Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('Round 1', style: TextStyle(fontSize: 27),),
                       SizedBox(height: 4.0), // Add spacing between the GridView and selected numbers container
                       Container(
                         height: 60,
                         width: double.infinity,
                         padding: EdgeInsets.all(12.0),
                         margin: EdgeInsets.all(12.0),
                         decoration: BoxDecoration(
                           // color: Colors.black, // Specify the desired color
                           borderRadius: BorderRadius.circular(15.0), // Specify the desired radius
                           border: Border.all(
                             color: Colors.black, // Border color
                             width: 3.0, // Border width
                           ),
                         ),
                         child: Center(
                           child: Text(
                             ' ${selectedNumbers.join(', ')}',
                             style: TextStyle(
                               color: Colors.black, // Text color
                               fontSize: 18.0,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),
                       ),

                       SizedBox(
                         height: 6,
                       ),
                       Text(
                         'Choose Your Numbers :',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                       ),
                       SizedBox(
                         height: 20,
                       ),
                       Container(
                         height: 230,
                         child: GridView.builder(
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 4,
                             crossAxisSpacing: 19,
                             // childAspectRatio: 1,
                           ),
                           itemCount: 12,
                           itemBuilder: (context, index) {
                             return InkWell(
                               onTap: () {
                                 toggleButtonState(index);
                               },
                               child: Container(
                                 decoration: BoxDecoration(
                                   color: buttonStates[index]
                                       ? Colors.orange.shade400
                                       : Colors.grey.shade200,
                                   borderRadius: BorderRadius.circular(15.0),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.black.withOpacity(0.2),
                                       spreadRadius: 2,
                                       blurRadius: 4,
                                       offset: Offset(15, 10),
                                     ),
                                   ],
                                 ),
                                 margin: EdgeInsets.only(
                                     bottom: 4, top: 10, right: 7, left: 7),
                                 child: Center(
                                   child: Text(
                                     '${index + 1}',
                                     style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 18.0,
                                     ),
                                   ),
                                 ),
                               ),
                             );
                           },
                         ),
                       ),
                       ElevatedButton(
                         onPressed: () {
                           // Add your logic to handle the 'Done' button click here.
                           // You can use the 'buttonStates' list to determine which buttons were selected.
                           print('Done');
                         },
                         child: Text('Done', style: TextStyle(fontSize: 20),),
                       ),
                     ],
                   ),
                 ),
               )

              ],
            ),
          ),
        ),

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
                  text: "REFFERAl",
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
                  onPressed: () async {
                    // Clear user login data and sign out
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.remove("login");
                    await prefs.setBool("isSignedOut", true);
                    // Navigate back to the login screen
                    Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen()));
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
      ),
    );
  }
}

