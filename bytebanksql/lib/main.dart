import 'package:bytebanksql/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'database/db.dart';
import 'models/contact.dart';

void main() {
  runApp(ByteBankSQL());
}

class ByteBankSQL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard()
    );
  }
}



