import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.labelText,
    this.isPassword = false,
    this.validator,
    this.data,
    this.dataKey,
  });

  final String? labelText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Map<String, dynamic>? data;
  final String? dataKey;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isObscured = true;

  IconData get obscureIcon =>
      isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined;

  void toggleObscure() => setState(
        () {
          isObscured = !isObscured;
        },
      );

  Widget? get suffix => widget.isPassword
      ? IconButton(
          icon: Icon(obscureIcon),
          onPressed: toggleObscure,
          padding: EdgeInsets.zero,
        )
      : null;

  void saveData(String? value) {
    if (widget.dataKey != null && widget.data != null) {
      widget.data![widget.dataKey!] = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: suffix,
        contentPadding: const EdgeInsets.all(20),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      scrollPadding: EdgeInsets.zero,
      obscureText: widget.isPassword && isObscured,
      validator: widget.validator,
      onChanged: saveData,
      onSaved: saveData,
    );
  }
}
