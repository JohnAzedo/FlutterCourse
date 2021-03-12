
class Contact {
  final int id;
  final String name;
  final String account;

  Contact(this.id, this.name, this.account);

  @override
  String toString() {
    return 'Contact{name: $name, account: $account}';
  }
}