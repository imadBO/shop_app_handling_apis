import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.label,
    required this.controller,
    this.obscure = false,
    this.readOnly = false,
    this.enabled = true,
    required this.type,
    required this.prefixIcon,
    this.suffixIcon,
    required this.validator,
    this.onTap,
    this.onSuffixTapped,
    this.onChanged,
    this.height,
    this.radius,
    this.contentPadding,
    this.marging,
    this.floatingBehavior,
  });

  final String label;
  final TextEditingController controller;
  final bool obscure;
  final bool readOnly;
  final bool enabled;
  final TextInputType type;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function()? onSuffixTapped;
  final void Function(String)? onChanged;
  final double? height;
  final double? radius;
  final EdgeInsets? contentPadding;
  final EdgeInsets? marging;
  final FloatingLabelBehavior? floatingBehavior;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 65,
      margin: marging ?? const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.text,
        obscureText: obscure,
        cursorColor: ColorsManager.blue,
        cursorHeight: 25,
        decoration: InputDecoration(
          label: Text(label),
          floatingLabelStyle: const TextStyle(color: ColorsManager.blue),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: onSuffixTapped,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 20),
          ),
          contentPadding: contentPadding,
          floatingLabelBehavior: floatingBehavior,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 20),
          ),
        ),
        readOnly: readOnly,
        enabled: enabled,
        validator: validator,
        onTap: onTap,
        onChanged: onChanged,
      ),
    );
  }
}
