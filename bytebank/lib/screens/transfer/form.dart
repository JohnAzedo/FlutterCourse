import 'package:bytebank/components/editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bytebank/models/transfer.dart';

class FormTransfer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormTransferState();
  }
}

class _FormTransferState extends State<FormTransfer> {
  final TextEditingController _controllerAccountNumber =
  TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  void _createTransfer(BuildContext context) {
    // Flutter is null safety now
    final Transfer transfer = Transfer(double.tryParse(_controllerValue.text),
        int.tryParse(_controllerAccountNumber.text));

    // Return transfer to ListTransfers
    if (transfer.account != null && transfer.account != null) {
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
        child: SingleChildScrollView(
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
      ),
    );
  }
}
