import 'package:flutter/material.dart';

class FormInputWrapper extends StatelessWidget {
  final TextFormField textFormField;

  const FormInputWrapper({Key? key, required this.textFormField})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 0.1,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: textFormField,
      ),
    );
  }
}
