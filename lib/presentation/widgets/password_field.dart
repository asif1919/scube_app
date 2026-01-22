import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'custom_text_field.dart';

/// Reusable Password Field Widget 
class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const PasswordField({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: widget.hintText ?? 'Password',
      obscureText: _obscurePassword,
      onChanged: widget.onChanged,
      validator: widget.validator,
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: AppColors.grey600,
        ),
        onPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
    );
  }
}
