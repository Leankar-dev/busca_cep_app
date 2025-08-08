import 'package:flutter/material.dart';

class CustomElevatedButtonIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final Widget label;

  const CustomElevatedButtonIcon({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: label,
    );
  }
}
