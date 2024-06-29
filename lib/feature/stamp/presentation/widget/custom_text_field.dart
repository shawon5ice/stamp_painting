import 'package:flutter/material.dart';

import '../../../../core/helpers/size_box_extension.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.label,
      required this.onChanged,
      this.prefixWidget});

  final String hint;
  final String label;
  final void Function(String) onChanged;
  final Widget? prefixWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        addHeight(4),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.orange),
            ),
            // filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.orange),
            ),
            fillColor: Colors.blue.withOpacity(0.1),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: prefixWidget,
          ),
          style: const TextStyle(color: Colors.blue),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
