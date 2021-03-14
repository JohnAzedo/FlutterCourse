import 'package:bytebanksql/http/webclient.dart';
import 'package:bytebanksql/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'database/db.dart';
import 'models/contact.dart';

void main() {
  runApp(ByteBankSQL());
  // findAll().then((value) => print(value));
}

class ByteBankSQL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard()
    );
  }
}



