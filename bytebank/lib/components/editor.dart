import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
