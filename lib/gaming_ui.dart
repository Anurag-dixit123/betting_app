import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalendarButtons(),
    );
  }
}

class CalendarButtons extends StatefulWidget {
  @override
  _CalendarButtonsState createState() => _CalendarButtonsState();
}

class _CalendarButtonsState extends State<CalendarButtons> {
  List<bool> buttonStates = List.generate(12, (index) => false);

  void toggleButtonState(int index) {
    setState(() {
      buttonStates[index] = !buttonStates[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> selectedNumbers = [];

    for (int i = 0; i < buttonStates.length; i++) {
      if (buttonStates[i]) {
        selectedNumbers.add(i + 1);
      }
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('Game Center')),
      //   backgroundColor: Color(0xFF030470),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.history), // You can change this icon to your desired one
      //       onPressed: () {
      //         // Add your logic here for the icon's action
      //         // For example, you can open a drawer or perform some other action.
      //
      //         print('Icon button pressed');
      //         Navigator.pushNamed(context, 'gamehistory');
      //       },
      //     ),
      //   ],
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Round 1', style: TextStyle(fontSize: 27),),
            SizedBox(height: 20.0), // Add spacing between the GridView and selected numbers container
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
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
              height: 10,
            ),
            Text(
              'Choose Your Numbers :',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 280,
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
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 141,left: 140, bottom: 20,top: 2),
        child: Container(
          height: 60,
          child: ElevatedButton(

            onPressed: () {
              // Add your logic to handle the 'Done' button click here.
              // You can use the 'buttonStates' list to determine which buttons were selected.
              print('Done');
            },
            child: Text('Done', style: TextStyle(fontSize: 20),),
          ),
        ),
      ),
    );
  }
}
