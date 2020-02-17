import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction action;
  final TextInputType type;
  final String hintText;
  final bool secureText;
  final bool readOnly;
  final Function onTap;

  InputField({
      this.controller,
      this.action,
      this.hintText,
      this.type,
      this.secureText = false,
      this.readOnly = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6),
        ),

        child: Padding(padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextField(
          controller: controller ,
          onTap: () => onTap != null ? onTap() : {} ,
          textInputAction: action,
          keyboardType: type,
          obscureText: secureText,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none
          ),
        ),),
    );
  }
}
