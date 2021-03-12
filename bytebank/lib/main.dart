import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListTransfers(),
      theme: ThemeData(
          primaryColor: Colors.blue[700],
          accentColor: Colors.lightBlueAccent[100],
          brightness: Brightness.light),
      darkTheme: ThemeData(
          accentColor: Colors.lightBlueAccent[400],
          brightness: Brightness.dark,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.lightBlueAccent[400],
            textTheme: ButtonTextTheme.primary,
          )),
      themeMode: ThemeMode.dark,
    );
  }
}
