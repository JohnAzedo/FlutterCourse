import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ByteBank()));

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('100.00'),
              subtitle: Text('João Pedro Limão'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('100.00'),
              subtitle: Text('João Pedro Limão'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('100.00'),
              subtitle: Text('João Pedro Limão'),
            ),
          ),
        ],
      ),
    );
  }
}
