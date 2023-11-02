import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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

Future<void> walletRequestApi2(BuildContext context) async { // Added 'BuildContext context'
  // Move the code to retrieve token and user ID here
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('userId');
  String? token = prefs.getString('login');

  var headers = {
    'Client-Service': 'frontend-client',
    'Auth-Key': 'simplerestapi',
    'Authorization': token!,
    'type': '2',
    'User-ID': userId!,
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://cripx.provisioningtech.com/post_ajax/wallet_request'));
  request.fields.addAll({
    'amount': '100',
    'deposit_url': 'sdddtdedyetdgyudg',
    'deposit_network': 'kshdjhdhduud',
    'deposit_to': 'duhyudiyudydwiudy',
    'deposit_status': '1',
    'loginid': userId,
  });

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  print('Wallet API Request - Response status code: ${response.statusCode}');
  if (response.statusCode == 200) {
    String responseBody = await response.stream.bytesToString();
    print('Response body: $responseBody');

    // Now that you've consumed the stream, you can process the response
    // Handle the successful response here
    final data = jsonDecode(responseBody);
    // Do something with the data
    print('Response body: $responseBody');

  } else {
    print(response.reasonPhrase);
    // Handle the error here
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
                      onPressed: () async {
                        // Handle recharge with a good luck message
                        // Call the walletRequestApi function from the parent widget
                        await walletRequestApi2(context);

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
