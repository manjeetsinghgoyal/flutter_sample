import 'package:flutter/material.dart';


class LabelWidget extends StatelessWidget {
  final String text;
  const LabelWidget({super.key, required this.text});


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }
}