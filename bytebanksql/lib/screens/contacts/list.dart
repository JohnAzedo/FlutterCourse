import 'package:bytebanksql/components/progress.dart';
import 'package:bytebanksql/database/dao/contact.dart';
import 'package:bytebanksql/database/db.dart';
import 'package:bytebanksql/models/contact.dart';
import 'package:bytebanksql/screens/contacts/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactList extends StatelessWidget {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(contact);
                },
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          );
        },
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contact.account,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
