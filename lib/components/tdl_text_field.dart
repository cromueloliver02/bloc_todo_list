import 'package:flutter/material.dart';

class TDLTextField extends StatelessWidget {
  const TDLTextField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.maxLines = 1,
    this.autofocus = false,
    this.filled = false,
  });

  final TextEditingController controller;
  final String label;
  final IconData? prefixIcon;
  final int? maxLines;
  final bool autofocus;
  final bool? filled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autofocus,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: filled,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        prefixIcon: Icon(prefixIcon),
        label: Text(label),
      ),
    );
  }
}
