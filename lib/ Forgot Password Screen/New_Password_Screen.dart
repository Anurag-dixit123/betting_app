import 'package:flutter/material.dart';

void main() {
  runApp(NewPasswordScreen());
}

class NewPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 12, right: 12 ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "New Password",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.only(right: 156.0),
                child: Text('Enter New Password', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 8,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      // Toggle password visibility
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(right: 140.0),
                child: Text('Confirm New Password', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 8,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      // Toggle password visibility
                    },
                  ),
                ),
              ),
              SizedBox(height: 24),
              Container(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality to change password here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // Orange color for the button
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
