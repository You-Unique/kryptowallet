import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? label;
  final String? hint;
  final Widget? suffixWidget;
  final bool obscure;
  final Widget? prefixWidget;
  final Color? hintcolor;
  final Color? labelcolor;
  final Color? bordercolor;
  final bool readOnly;
  final double? hintsize;
  final Color? fillcolor;
  final VoidCallback? onTap;

  const InputField({
    super.key,
    required this.textEditingController,
    this.label,
    this.prefixWidget,
    this.suffixWidget,
    this.hint,
    this.obscure = false,
    this.hintcolor,
    this.labelcolor,
    this.bordercolor,
    this.readOnly = false,
    this.hintsize = 12,
    this.fillcolor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: textEditingController,
      style: TextStyle(color: Colors.white, fontSize: 20),
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: labelcolor,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: hintsize,
          color: hintcolor,
        ),
        filled: true,
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        fillColor: fillcolor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: bordercolor ?? Colors.transparent,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: bordercolor ?? Colors.transparent,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: bordercolor ?? Colors.transparent,
            width: 2.5,
          ),
        ),
      ),
    );
  }
}
