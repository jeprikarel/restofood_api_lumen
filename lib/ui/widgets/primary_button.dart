import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onClick;

  PrimaryButton({this.color, this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      onPressed: onClick,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
