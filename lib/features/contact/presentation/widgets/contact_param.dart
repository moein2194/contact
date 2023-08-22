import 'package:flutter/material.dart';

class ContactParam extends StatelessWidget {
  final String title;
  final String? details;
  const ContactParam({super.key,
  this.details,
  required this.title,});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                          Text(
                    title,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelMedium!.apply(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    details ?? "Nothing to show!",
                    style: theme.textTheme.bodyLarge,
                  ),
      ],
    );
  }
}
