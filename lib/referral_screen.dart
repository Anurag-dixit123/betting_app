import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReferralScreen(),
    );
  }
}

class ReferralScreen extends StatelessWidget {
  final String inviteCode = "ABC123"; // Replace with your actual invite code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Referral Screen")),
        backgroundColor: Color(0xFF030430),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press here
            Navigator.pushNamed(context, 'app');
          },
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          color: Color(0xFF030430),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('INVITE A FRIEND', style: TextStyle(fontSize: 22, color: Colors.white),),
              SizedBox(height: 20.0),
              Container(
                height: 45,
                width: 170,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your invite logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Pink invite button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                  child: Text(
                    "Invite Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "Invite Code : ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    inviteCode,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  IconButton(
                    icon: Icon(Icons.content_copy),
                    color: Colors.white,
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: inviteCode));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Invite code copied to clipboard!"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
