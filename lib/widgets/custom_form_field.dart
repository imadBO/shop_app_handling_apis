import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.label,
    required this.controller,
    this.readOnly = false,
    required this.type,
    required this.prefixIcon,
    this.suffixIcon,
    required this.validator,
    this.onTap,
    this.onChanged,
  });

  final String label;
  final TextEditingController controller;
  final bool readOnly;
  final TextInputType type;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          label: Text(label),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(suffixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        readOnly: readOnly,
        validator: validator,
        onTap: onTap,
        onChanged: onChanged,
      ),
    );
  }
}
