import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry margin;
  final String? hintText;
  final String? Function(String? value)? validator;
  const AppTextField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.margin = const EdgeInsets.symmetric(horizontal: 8),
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    double borderRadius = 20;
    ThemeData theme = Theme.of(context);

    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: theme.colorScheme.primary.withOpacity(0.2),
      ),
    );

    return Padding(
      padding: margin,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: keyboardType == TextInputType.multiline ? 3 : 1,
        maxLength: keyboardType == TextInputType.multiline ? 200 : null,
        validator: validator,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          border: border,
          enabledBorder: border,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 1,
            ),
          ),
          fillColor: theme.colorScheme.onTertiary,
          focusColor: theme.colorScheme.onTertiary,
          hoverColor: theme.colorScheme.onTertiary,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          prefixIconColor: theme.colorScheme.primaryContainer,
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium!.apply(
            color: theme.colorScheme.tertiary,
          ),
        ),
        cursorWidth: 1.5,
        cursorHeight: 20,
      ),
    );
  }
}
