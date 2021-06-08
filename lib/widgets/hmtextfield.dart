import 'package:flutter/material.dart';

class HMTextField extends StatefulWidget {
  const HMTextField({Key? key}) : super(key: key);

  @override
  _HMTextFieldState createState() => _HMTextFieldState();
}

class _HMTextFieldState extends State<HMTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'ERROR';
        }
      },
      decoration: InputDecoration(
        labelText: 'Ex: Cooking Class',
        helperText: '*Name shou􀋜d be max 120 characters',
        errorText: '*Name shou􀋜d be max 120 characters',
      ),
    );
  }
}
