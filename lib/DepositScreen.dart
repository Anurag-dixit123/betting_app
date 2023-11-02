import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      home: DepositScreen(),
    ),
  );
}

class DepositScreen extends StatefulWidget {


  Future<void> walletRequestApi(BuildContext context) async { // Added 'BuildContext context'
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
      'deposit_status': '0',
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
      // Access and print specific data from the API response
      print('Deposit URL: ${data['deposit_url']}');
      print('Deposit Network: ${data['deposit_network']}');
      print('Deposit To: ${data['deposit_to']}');
      print('Deposit Status: ${data['deposit_status']}');
    } else {
      print(response.reasonPhrase);
      // Handle the error here
    }
  }


  void copyToClipboard(String textToCopy, BuildContext context) {
    Clipboard.setData(ClipboardData(text: textToCopy));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Address copied to clipboard'),
    ));
  }



  @override
  _DepositScreenState createState() => _DepositScreenState();
}
class _DepositScreenState extends State<DepositScreen> {
  TextEditingController depositAddressController = TextEditingController();
  String? selectedNetwork = null;
  String? selectedDepositTo =null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,), // Back arrow icon
          onPressed: () {
            // Handle back button press here
            Navigator.pushNamed(context, 'app');
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 90.0),
          child: Column(
            children: [
              Text(
                'Deposit',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'USDT',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 2, left: 2),
            child: Container(
              width: 48,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.help_outline_outlined, color: Colors.black,size: 20,), // Icon for question mark
                    onPressed: () {
                      // Add your question mark button action here
                    },
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.history, color: Colors.black,), // Icon for history
            onPressed: () {
              // Add your history button action here
            },
          ),
        ],
      ),
      body: ListView( // Use ListView instead of SingleChildScrollView
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 0), // Adjust top padding as needed
        children: [
          // Deposit Image
          Image.asset('assets/images/qrcode.jpg',
        fit: BoxFit.contain,
        width: 180, // Adjust the width as needed
        height: 230, ),// Adjust the height as needed // Replace with your image path

          // Deposit Address with "Copy" button
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: depositAddressController,
                  decoration: InputDecoration(
                    labelText: 'Deposit Address >',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  String depositAddress = depositAddressController.text;
                  // You can save the deposit address or perform any other action here
                  // For example, you can call a function to copy it to the clipboard.
                  widget.copyToClipboard(depositAddress, context);
                },
                icon: Icon(Icons.content_copy), // Copy icon
              ),
            ],
          ),
          // Warning Disclaimer
          Container(
            color: Colors.grey.shade200,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(top: 16),
            child: Text(
              'Disclaimer: Your funds are at risk. Please read our terms and conditions.',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Deposit Network
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Deposit Network:',
                    style: TextStyle(fontSize: 15),
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.error_outline_outlined, size: 16), // Arrow on the right
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry>[
                        PopupMenuItem(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey), // Add border
                            ),
                            child: ListTile(
                              title: Text(
                                'Please choose carefully',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ];
                    },
                  ),
                ],
              ),
              // Dropdown with options
              Container(
                height: 40,
                width: 400, // Adjust the width as needed
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10), // Add border
                ),
                child: DropdownButton<String>(
                  value: selectedNetwork,
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Choose one'),
                  ), // Add a hint
                  isExpanded: true, // Set isExpanded to true
                  items: ['Option 1', 'Option 2', 'Option 3', 'Option 4']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(value,style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700,), ),
                      ),
                      // Set alignLabelWithHint to true for right-aligned arrow
                      // This will align the label (text) with the hint (arrow)
                      // and position the arrow to the right
                      // This is what moves the arrow to the right side
                      alignment: Alignment.centerLeft,
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedNetwork = newValue;
                    });
                    if (newValue != null) {
                      // Handle network selection
                    }
                  },
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text(
                    'Deposit To',
                    style: TextStyle(fontSize: 17),
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.error_outline_outlined, size: 16), // Arrow on the right
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry>[
                        PopupMenuItem(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey), // Add border
                            ),
                            child: ListTile(
                              title: Text(
                                'Please choose carefully',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ];
                    },
                  ),
                ],
              ),
              Container(
                height: 40,
                width: 400, // Adjust the width as needed
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10), // Add border
                ),
                child: DropdownButton<String>(
                  value: selectedDepositTo, // Use the selectedDepositTo variable
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Choose one'),
                  ), // Add a hint
                  isExpanded: true, // Set isExpanded to true
                  items: ['Option 1', 'Option 2', 'Option 3', 'Option 4']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(value, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                      ),
                      // Set alignLabelWithHint to true for right-aligned arrow
                      // This will align the label (text) with the hint (arrow)
                      // and position the arrow to the right
                      // This is what moves the arrow to the right side
                      alignment: Alignment.centerLeft,
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDepositTo = newValue;
                    });
                    if (newValue != null) {
                      // Handle network selection
                    }
                  },
                ),
              ),
              SizedBox(height: 14,),
              Padding(
                padding: const EdgeInsets.only(right: 220.0),
                child: Text('Transaction info', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 14,),
              Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50), // Set a circular border radius
                    ),
                  ),
                  onPressed: () async {
                    // Call the walletRequestApi function from the parent widget
                    await widget.walletRequestApi(context);


                  },
                  child:
                      Text('Share Deposit details', style: TextStyle(fontSize: 22, color: Colors.white)),

                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
