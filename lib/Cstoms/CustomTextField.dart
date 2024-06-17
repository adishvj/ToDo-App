import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.labels,
  });

  TextEditingController controller;
  String labels;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labels,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter title';
        }
        return null;
      },
    );
  }
}
