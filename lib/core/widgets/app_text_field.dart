import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? margin;
  final String? hintText;
  const AppTextField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.margin = const EdgeInsets.symmetric(horizontal: 8),
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(32),
      ),
      margin: margin,
      child: TextFormField(
        key: key,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: keyboardType == TextInputType.multiline ? 3 : 1,
        maxLength: keyboardType == TextInputType.multiline ? 200 : null,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 1,
            ),
          ),
          fillColor: theme.colorScheme.background,
          focusColor: theme.colorScheme.background,
          hoverColor: theme.colorScheme.background,
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: theme.colorScheme.primaryContainer,
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium!.apply(
            color: theme.colorScheme.primaryContainer,
          ),
        ),
        cursorWidth: 1.5,
        cursorHeight: 20,
      ),
    );
  }
}
