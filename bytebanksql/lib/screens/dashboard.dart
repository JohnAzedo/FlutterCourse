import 'package:bytebanksql/screens/contacts/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Image.asset('images/logo.png'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.people),
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactList(),
            ),
          ),
        },
      ),
    );
  }
}
