import 'package:flutter/material.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListTransfers(),
    );
  }
}

class FormTransfer extends StatelessWidget {
  final TextEditingController _controllerAccountNumber =
      TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  void _createTransfer(BuildContext context) {
    // Flutter is null safety now
    final Transfer transfer = Transfer(
        double.tryParse(_controllerValue.text),
        int.tryParse(_controllerAccountNumber.text)
    );

    // Return transfer to ListTransfers
    if(transfer.account != null && transfer.account != null){
      Navigator.pop(context, transfer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: Column(
          children: <Widget>[
            Editor(
                controller: _controllerAccountNumber,
                label: 'Account number',
                hint: '00000-X'),
            Editor(
                controller: _controllerValue,
                label: 'Value',
                hint: '0.00',
                icon: Icon(Icons.monetization_on)),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0.0,
              ),
              child: ElevatedButton(
                onPressed: () => _createTransfer(context),
                child: Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final Icon icon;

  Editor({this.controller, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 24.0),
      decoration: InputDecoration(icon: icon, labelText: label, hintText: hint),
      keyboardType: TextInputType.number,
    );
  }
}

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
            final Transfer transfer =  widget._transfers[index];
            return ItemTransfer(transfer);
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final Future<Transfer> future = Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return FormTransfer();
              }),
            );
            // Get transfer from FormTransfer
            future.then((transfer) {
              if(transfer != null){
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

class Transfer {
  final double value;
  final int account;

  Transfer(this.value, this.account);
}
