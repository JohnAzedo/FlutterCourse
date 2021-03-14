import 'package:bytebanksql/components/progress.dart';
import 'package:bytebanksql/http/webclient.dart';
import 'package:bytebanksql/models/contact.dart';
import 'package:bytebanksql/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
          future: findAll(),
          builder: (context, snapshot) {
            final List<Transaction> transactions = snapshot.data;

            switch(snapshot.connectionState){
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                return Progress();
                break;
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Transaction transaction = transactions[index];
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.monetization_on),
                        title: Text(
                          transaction.value.toString(),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          transaction.contact.account,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: transactions.length,
                );
                break;
            }
            return Text('Unknown Error');

          }),
    );
  }
}
