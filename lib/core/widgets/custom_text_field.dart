import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final int? maxLength;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;

  const CustomTextField({
    super.key,
    this.keyboardType,
    this.maxLength,
    this.prefixIcon,
    this.labelText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        hintText: hintText,
        counterText: '',
      ),
    );
  }
}
