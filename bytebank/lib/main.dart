import 'package:flutter/material.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormTransfer(),
    );
  }
}

class FormTransfer extends StatelessWidget {
  final TextEditingController _controllerAccountNumber = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

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
            TextField(
              controller: _controllerAccountNumber,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                  labelText: 'Account number', hintText: '00000-X'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _controllerValue,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                  labelText: 'Value',
                  hintText: '0.00',
                  icon: Icon(Icons.monetization_on)),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0.0,
              ),
              child: ElevatedButton(
                onPressed: (){
                  // Flutter is null safety now
                  Transfer(
                      double.tryParse(_controllerValue.text),
                      int.tryParse(_controllerAccountNumber.text)
                  );
                },
                child: Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListTransfers extends StatelessWidget {
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
      body: Column(children: [
        ItemTransfer(Transfer(100, 1)),
        ItemTransfer(Transfer(200, 2)),
        ItemTransfer(Transfer(300, 3)),
      ]),
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
