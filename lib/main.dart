import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//myClass
import './transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

    final List<Transaction> transactions =[
    Transaction(id: 'mh-2022',title: 'phone',amount: 25.99,createdAt:DateTime.now() ),
    Transaction(id: 'mh-2022',title: 'net',amount: 100.99,createdAt:DateTime.now() ),
    Transaction(id: 'mh-2022',title: 'water',amount: 49.99,createdAt:DateTime.now() ),
  ];

@override
Widget build(BuildContext context){
return Scaffold(
  appBar: AppBar(
    title: const Text('Hello'),
    ),
    body: Column(
   //   mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Container(
        width: double.infinity,
        child: const Card(
          color: Colors.blue,
          child: Text('Chart'),
          elevation: 5,
        ),
      ),
      Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child:
           Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
            ),
             TextField(
              decoration: InputDecoration(labelText: 'Amount'),
            ),
          FlatButton(
            onPressed: (){}, 
            textColor: Colors.purple,
            child: Text('add Transaction')),
          ],),
        ),
      ),
     Column(children: transactions.map((transaction){
       return Card(
         child: Row(
           children: [
             Container(
               margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
               padding: EdgeInsets.all(10),
               child: Text(
                 '\$${transaction.amount}',
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Colors.purple,
                   fontSize: 20
                   ),
                 ),
               decoration: BoxDecoration(
                 border: Border.all(
                   color: Colors.purple,
                   width: 2
                   ),        
                 ),
               ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               Container(
                 child: Text(transaction.title,
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 16,
                   color: Colors.black
                   ),
                 ),
                 ),
                 Container(
                   child: Text(DateFormat.yMMMMd("en_US").format(transaction.createdAt),
                              style: TextStyle(color: Colors.black45),
                   ),
                   ),
             ],)
           ],
         ),
         );
     }).toList(),)
    ],),
);
}
}
