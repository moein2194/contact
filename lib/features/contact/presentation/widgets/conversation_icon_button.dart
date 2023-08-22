import 'package:contact/config/enums.dart';
import 'package:flutter/material.dart';

class ConversationIconButton extends StatelessWidget {
  final ConversationType conversationType;
  final VoidCallback onPressed;
  const ConversationIconButton({
    super.key,
    required this.conversationType,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: iconColor(
          conversationType,
          theme,
        ),
      ),
      alignment: Alignment.center,
      child: Icon(
        iconButton(conversationType),
        color: theme.colorScheme.background,
        size: 20,
      ),
    );
  }

  IconData iconButton(ConversationType type) {
    switch (type) {
      case ConversationType.call:
        return Icons.call_rounded;
      case ConversationType.email:
        return Icons.mail_rounded;
      case ConversationType.message:
        return Icons.message_rounded;
    }
  }

  Color iconColor(ConversationType type, ThemeData themeData) {
    switch (type) {
      case ConversationType.email:
        return Colors.deepPurple;
      case ConversationType.call:
        return themeData.colorScheme.secondary.withOpacity(0.8);
      case ConversationType.message:
        return themeData.colorScheme.primary;
    }
  }
}
