import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'form.dart';

class ListTransfers extends StatefulWidget {
  final List<Transfer> _transfers = [];

  @override
  State<StatefulWidget> createState() {
    return _ListTransfersState();
  }
}

class _ListTransfersState extends State<ListTransfers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      body: ListView.builder(
          itemCount: widget._transfers.length,
          itemBuilder: (context, index) {
            final Transfer transfer = widget._transfers[index];
            return ItemTransfer(transfer);
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final Future<Transfer> future = Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FormTransfer();
              }),
            );
            // Get transfer from FormTransfer
            future.then((transfer) {
              if (transfer != null) {
                setState(() {
                  widget._transfers.add(transfer);
                });
              }
            });
          }),
    );
  }
}

class ItemTransfer extends StatelessWidget {
  final Transfer _transfer;

  ItemTransfer(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.account.toString()),
      ),
    );
  }
}