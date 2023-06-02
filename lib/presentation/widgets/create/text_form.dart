import 'package:flutter/material.dart';

import '../../../config/input_decoration_create.dart';


class TextForm extends StatefulWidget
 {
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final Function(String value) onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;

  const TextForm(this.obscureText,this.hintText, this.labelText, this.prefixIcon, this.onChanged,this.validator,{super.key, this.keyboardType});

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) 
  {
   return TextFormField(
    obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
       autocorrect: false,
       style: const TextStyle(color: Colors.black),
       autovalidateMode: AutovalidateMode.onUserInteraction,
       validator: widget.validator,
       onChanged: widget.onChanged,
       decoration: InputDecorationCreate.authInputDecoration(
                hintText: widget.hintText,
                labelText: widget.labelText,
                prefixIcon: widget.prefixIcon),
                maxLength: 20,
      initialValue: "",);
  }
}