import 'package:bytebanksql/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import '../db.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE contacts('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account Text)';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> map = Map();
    map['name'] = contact.name;
    map['account'] = contact.account;
    return db.insert('contacts', map);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('contacts');
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row['id'],
        row['name'],
        row['account'],
      );
      contacts.add(contact);
    }

    return contacts;
  }
}
