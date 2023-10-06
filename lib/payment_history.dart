// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class Transaction {
//   final String serialNumber;
//   final double amount;
//   final DateTime dateTime;
//
//   Transaction({
//     required this.serialNumber,
//     required this.amount,
//     required this.dateTime,
//   });
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Payment History',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Center(child: Text('Payment History')),
//           backgroundColor: Color(0xFF030430),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               // Handle back button press here
//               Navigator.pushNamed(context, 'app');
//             },
//           ),
//         ),
//         body: TransactionList(),
//       ),
//     );
//   }
// }
//
// class TransactionList extends StatefulWidget {
//   @override
//   _TransactionListState createState() => _TransactionListState();
// }
//
// class _TransactionListState extends State<TransactionList> {
//   List<Transaction> transactions = [];
//
//   @override
//   void initState() {
//     // Simulate loading transactions from a data source (e.g., an API)
//     loadTransactions();
//     super.initState();
//   }
//
//   void loadTransactions() {
//     // Simulate fetching transactions from an API or database.
//     // Replace this with your actual data fetching logic.
//     // Here, we'll use dummy data for demonstration.
//     setState(() {
//       transactions = [
//         Transaction(
//           serialNumber: 'TXN001',
//           amount: 100.00,
//           dateTime: DateTime(2023, 10, 3, 10, 30),
//         ),
//         Transaction(
//           serialNumber: 'TXN002',
//           amount: 50.00,
//           dateTime: DateTime(2023, 10, 2, 15, 45),
//         ),
//         // Add more transactions here
//       ];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xFF030430),
//       height: double.infinity,
//       width: double.infinity,
//       child: ListView.builder(
//         itemCount: transactions.length,
//         itemBuilder: (ctx, index) {
//           final transaction = transactions[index];
//           return ListTile(
//             leading: Text(transaction.serialNumber, style: TextStyle(color: Colors.white),),
//             title: Text('\$${transaction.amount.toStringAsFixed(2)}', style: TextStyle(color: Colors.white),),
//             subtitle: Text(
//               '${transaction.dateTime.toLocal().toString()}', style: TextStyle(color: Colors.white),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

void main() {
  runApp(Payment());
}

class Transaction {
  final String serialNumber;
  final double amount;
  final DateTime dateTime;

  Transaction({
    required this.serialNumber,
    required this.amount,
    required this.dateTime,
  });
}

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment History',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Payment History')),
          backgroundColor: Color(0xFF030430),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button press here
              Navigator.pushNamed(context, 'app');
            },
          ),
        ),
        body: TransactionList(),
      ),
    );
  }
}

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  List<Transaction> transactions = [];

  @override
  void initState() {
    // Simulate loading transactions from a data source (e.g., an API)
    loadTransactions();
    super.initState();
  }

  void loadTransactions() {
    // Simulate fetching transactions from an API or database.
    // Replace this with your actual data fetching logic.
    // Here, we'll use dummy data for demonstration.
    setState(() {
      transactions = [
        Transaction(
          serialNumber: 'TXN001',
          amount: 100.00,
          dateTime: DateTime(2023, 10, 3, 10, 30),
        ),
        Transaction(
          serialNumber: 'TXN002',
          amount: 50.00,
          dateTime: DateTime(2023, 10, 2, 15, 45),
        ),
        // Add more transactions here
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF030430),
      // height: double.infinity,
      // width: double.infinity,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final transaction = transactions[index];
          return Column(
            children: [
              ListTile(
                leading: Text(
                  transaction.serialNumber,
                  style: TextStyle(color: Colors.white),
                ),
                title: Text(
                  '₹ ${transaction.amount.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '${transaction.dateTime.toLocal().toString()}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              if (index == transactions.length - 2)
                Divider(color: Colors.white), // Add a Divider only after the last transaction
            ],
          );
        },
      ),
    );
  }
}
