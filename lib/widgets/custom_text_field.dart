// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(this.label,{super.key, required this.cont, required this.obscure, this.placeholder, required this.keyboard, this.isEnabled, this.validator});

  final String label;
  final TextEditingController cont;
  final bool obscure;
  final String? placeholder;
  final TextInputType keyboard;
  final bool? isEnabled;
  final String? Function(String?)? validator;
  
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField>{

  @override
  void dispose(){
    // widget.cont.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: TextFormField(
        obscureText: widget.obscure,
        controller: widget.cont,
        initialValue: widget.placeholder != '' ? widget.placeholder : '',
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: widget.label,
        ),
        keyboardType: widget.keyboard,
        enabled: widget.isEnabled,
        validator: widget.validator,
      ),
    );
  }
}

