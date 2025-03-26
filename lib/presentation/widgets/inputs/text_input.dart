import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorMessage;
  final bool isPassword;
  final bool readOnly;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const TextInput({
    super.key,
    this.label,
    this.hintText,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.isPassword = false,
    this.controller,
    this.focusNode,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    );

    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hintText,
        errorText: errorMessage,
        errorBorder: border.copyWith(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
