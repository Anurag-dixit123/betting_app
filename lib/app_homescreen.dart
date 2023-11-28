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
  List<int> selectedNumbers = [];
  bool isButtonEnabled = true;

  String? username = '';
  String? registrationDate = '';
  String? lastAccess = '';
  String? wbId = '0';
  String? wbTT = '0';
  String? wbLoginId = '';
  String? wbAccountBalance = '0';
  String? wbEarnedTotal = '0';
  String? wbActiveDeposit = '0';
  String? wbTotalWithdrawal = '0';
  String? wbLastDeposit = '0';
  String? wbLastWithdrawal = '0';
  String rln = ''; // Initialize with an empty string


  @override
  void initState() {
    super.initState();
    // Make the API call when the screen is loaded
    BankDetailsUpdateApi(context);
    // Call the second API function
    WalletBalanceApi(context);
    // Call the third API function
    GetRoundApi(context);

    //Call the 5th api
    GetRoundResultAPi(context);

  }


  void saveRLId(String rlId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('rl_id', rlId);
    // print('Saved RL_ID: $rlId'); // Print the RL_ID value
  }

  void saveRLtt(String rltt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('rl_tt', rltt);
    print('Saved RL_TT: $rltt'); // Print the RL_ID value
  }

  // 1st API Validation
  void BankDetailsUpdateApi(BuildContext context) async {

      print('Sending Data To 1st BankDetails Api...');
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

        print('Response status code of 1st BankDetailsApi: ${response.statusCode}');
        print('Response body data of 1st Api: ${response.body}'); // Print the response status code and body

        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          final detail = body['detail'][0];
           username = detail['BRANCH_USERNAME'];
           registrationDate = detail['BRANCH_TT'].substring(0, 10); // Extract the date part
           lastAccess = detail['BRANCH_TT'].substring(11); // Extract the time part

          // Now you can print or use these variables as needed
          // print('Username: $username');
          // print('Registration Date: $registrationDate');
          // print('Last Access: $lastAccess');
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

// 2nd Api Integration
  void WalletBalanceApi(BuildContext context) async {
    print('Sending Data To 2nd Wallet API...');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String? token = prefs.getString('login');
    String? ciSession = prefs.getString('ci_session'); // Retrieve the ci_session cookie from SharedPreferences

    if (token != null && userId != null) {
      var headers = {
        'Client-Service': 'frontend-client',
        'Auth-Key': 'simplerestapi',
        'Authorization': token,
        'type': '2',
        'User-ID': userId,
        if (ciSession != null) 'Cookie': 'ci_session=$ciSession', // Include ci_session cookie if available
      };

      var request = http.MultipartRequest('POST', Uri.parse('https://cripx.provisioningtech.com/get_ajax/wallet_balance'));
      request.fields.addAll({
        'loginid': userId,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      print('Response status code of 2nd WalletBalanceApi: ${response.statusCode}');
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        final data = jsonDecode(responseBody);
        print('Response body data of 2nd Api: ${responseBody}'); // Print the entire response body

        if (data != null) {
          // Update only the 'wb' variables from the API response.
          setState(() {
            wbId = data['WB_ID']?.toString() ?? '0';
            wbTT = data['WB_TT']?.toString() ?? '0';
            wbLoginId = data['WB_LOGIN_ID']?.toString() ?? '0';
            wbAccountBalance = data['WB_ACCOUNT_BALANCE']?.toString() ?? '0';
            wbEarnedTotal = data['WB_EARNED_TOTAL']?.toString() ?? '0';
            wbActiveDeposit = data['WB_ACTIVE_DEPOSIT']?.toString() ?? '0';
            wbTotalWithdrawal = data['WB_TOTAL_WITH_DRAWL']?.toString() ?? '0';
            wbLastDeposit = data['WB_LAST_DEPOSIT']?.toString() ?? '0';
            wbLastWithdrawal = data['WB_LAST_WITHDRAWL']?.toString() ?? '0';
          });
        } else {
          // Handle the case where the response does not contain the expected data.
          print('API response does not contain expected data');
          // Set 'wb' variables to '0' when the response is null or doesn't contain the expected data.
          setState(() {
            wbId = '0';
            wbTT = '0';
            wbLoginId = '0';
            wbAccountBalance = '0';
            wbEarnedTotal = '0';
            wbActiveDeposit = '0';
            wbTotalWithdrawal = '0';
            wbLastDeposit = '0';
            wbLastWithdrawal = '0';
          });
        }
      } else {
        print('Error: ${response.reasonPhrase}');
        // Handle the error or take appropriate action as needed
      }
    } else {
      print('Token, User ID, or ci_session missing');
      // Handle the case when the token, user ID, or ci_session is missing

      // Set 'wb' variables to '0' when essential data is missing.
      setState(() {
        wbId = '0';
        wbTT = '0';
        wbLoginId = '0';
        wbAccountBalance = '0';
        wbEarnedTotal = '0';
        wbActiveDeposit = '0';
        wbTotalWithdrawal = '0';
        wbLastDeposit = '0';
        wbLastWithdrawal = '0';
      });
    }
  }


// 3rd Api Integration
  void GetRoundApi(BuildContext context) async {
    print('Sending Data To 3rd GetRound API...');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String? token = prefs.getString('login');
    String? ciSession = prefs.getString('ci_session'); // Retrieve the ci_session cookie from SharedPreferences
    //
    // print('Token for Wallet API: $token');

    if (token != null && userId != null) {
      var headers = {
        'Client-Service': 'frontend-client',
        'Auth-Key': 'simplerestapi',
        'Authorization': token,
        'type': '2',
        'User-ID': userId,
        if (ciSession != null) 'Cookie': 'ci_session=$ciSession', // Include ci_session cookie if available
      };

      var request = http.MultipartRequest('POST', Uri.parse(
          'https://cripx.provisioningtech.com/get_ajax/get_round_list'));
      request.fields.addAll({
        'loginid': userId,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      print('Response status code of 3rd GetRoundApi: ${response.statusCode}');

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print('Response body data of 3rd Api: $responseBody');
        // Process the response as needed
        final data = jsonDecode(responseBody);

        if (data.isNotEmpty) {
          String rlId = data[0]["RL_ID"];
          String rltt = data[0]["RL_TT"].substring(0, 10); // Extract the date part (first 10 characters)
          // Save RL_ID to SharedPreferences
          saveRLId(rlId);
          saveRLtt(rltt);


          setState(() {
            rln = data[0]["RL_NO"];
          });
        } else {
          print('Error: Empty response');
          // Handle the error or take appropriate action as needed
        }
      } else {
        print('Token, User ID, or ci_session missing');
        // Handle the case when the token, user ID, or ci_session is missing
      }
    }
  }

//4th Api Integration
  void PlayGameAPi(BuildContext context) async {
    print('Sending Data To PlayGame API...');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String? token = prefs.getString('login');
    String? ciSession = prefs.getString('ci_session');
    String? rlId = prefs.getString('rl_id');

    // Retrieve the selected numbers from shared preferences
    List<int> selectedNumbers = prefs.getStringList('selected_numbers')?.map((s) => int.parse(s))?.toList() ?? [];
    if (token != null && userId != null && rlId != null) {
      var headers = {
        'Client-Service': 'frontend-client',
        'Auth-Key': 'simplerestapi',
        'Authorization': token,
        'type': '2',
        'User-ID': userId,
        if (ciSession != null) 'Cookie': 'ci_session=$ciSession',
      };

      var request = http.MultipartRequest('POST', Uri.parse(
          'https://cripx.provisioningtech.com/post_ajax/play_round'));
      request.fields.addAll({
        'loginid': userId,
        'round_no': rlId,
        // Use the selected numbers as the 'round_value'
        'round_value': selectedNumbers.join(', '), // Convert the list to a comma-separated string
        'amount': '1'
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      print('Response status code of 4th PlayGameApi: ${response.statusCode}');

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print('Response body: $responseBody');

        final data = jsonDecode(responseBody);
        if (data != null && data is List && data.isNotEmpty) {
          setState(() {
            rln = data[0]["RL_NO"];
          });
        }
      } else {
        print('Token, User ID, ci_session, or RL_ID missing');
        // Handle the case when the token, user ID, ci_session, or RL_ID is missing
      }
    }
  }


  //5th Api Integration
  void GetRoundResultAPi(BuildContext context) async {
    print('Sending Data 5th GetRoundResult API...');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String? token = prefs.getString('login');
    String? ciSession = prefs.getString('ci_session');
    String? rlId = prefs.getString('rl_id');
    String? rltt = prefs.getString('rl_tt');
    print(rltt);


    // Retrieve the selected numbers from shared preferences
    List<int> selectedNumbers = prefs.getStringList('selected_numbers')?.map((s) => int.parse(s))?.toList() ?? [];
    if (token != null && userId != null && rlId != null && rltt != null) {
      var headers = {
        'Client-Service': 'frontend-client',
        'Auth-Key': 'simplerestapi',
        'Authorization': token,
        'type': '2',
        'User-ID': userId,
        if (ciSession != null) 'Cookie': 'ci_session=$ciSession',
      };

      var request = http.MultipartRequest('POST', Uri.parse(
          'https://cripx.provisioningtech.com/get_ajax/get_round_result'));
      request.fields.addAll({
        'round_no': rlId,
         'date': rltt,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      print('Response status code of 5th PlayGameApi: ${response.statusCode}');

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print('Response body: $responseBody');

        // final data = jsonDecode(responseBody);
        // if (data != null && data is List && data.isNotEmpty) {
        //   setState(() {
        //     rln = data[0]["RL_NO"];
        //   });
        // }
      } else {
        print('Token, User ID, ci_session, or RL_ID missing');
        // Handle the case when the token, user ID, ci_session, or RL_ID is missing
      }
    }
  }


  void _onButtonPressed() async {
    if (isButtonEnabled) {
      print('Done');
      // Save the selected numbers to shared preferences
      saveSelectedNumbers(selectedNumbers);
      print(selectedNumbers);
      // Call the fourth API function
      PlayGameAPi(context);
      // Additional logic you want to perform.
      // For example, show a message.
      print('Button Pressed');

      // Disable the button after use.
      setState(() {
        isButtonEnabled = false;
      });
    }
  }

  void toggleButtonState(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int amount = 0;

        return Container(
          constraints: BoxConstraints(
            maxWidth: 300, // Set your desired max width
          ),
          child: AlertDialog(
            title: Text('Enter Amount for Number - ${index + 1}', style: TextStyle(fontSize: 18),),
            content: Column(
              mainAxisSize: MainAxisSize.min, // Ensure the dialog is not too large

              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    amount = int.tryParse(value) ?? 0;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add the selected number with the entered amount to the list
                    selectedNumbers.add(index + 1);
                    // Additional logic with the amount if needed
                    // Print the entered amount
                    print('Entered Amount for Number ${index + 1}: $amount');

                    // Call the fourth API function
                    PlayGameAPi(context);
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void saveSelectedNumbers(List<int> numbers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('selected_numbers', numbers.map((e) => e.toString()).toList());
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
                                        "$wbAccountBalance",
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
                                Navigator.pushNamed(context, 'deposit');
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
                                        "$wbEarnedTotal",
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
                                        "$wbActiveDeposit",
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
                                    Text('$wbLastDeposit'),
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
                                        "$wbTotalWithdrawal",
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
                                    Text('$wbLastWithdrawal'),
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
               //The Game UI Code
               Container(
                 child: Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("$rln", style: TextStyle(fontSize: 27),),
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
                         onPressed: isButtonEnabled ? _onButtonPressed : null,
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
                    Navigator.pushNamed(context, 'deposit');
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

