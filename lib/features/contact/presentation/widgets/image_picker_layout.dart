import 'package:flutter/material.dart';

class ImagePickerLayout extends StatelessWidget {
  final VoidCallback onPressedCamera;
  final VoidCallback onPressedGallery;

  const ImagePickerLayout({
    super.key,
    required this.onPressedCamera,
    required this.onPressedGallery,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onPressedGallery,
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.colorScheme.tertiary,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Gallery",
                  style: theme.textTheme.bodyMedium!.apply(
                    color: theme.colorScheme.background,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onPressedCamera,
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.colorScheme.tertiary,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Camera",
                  style: theme.textTheme.bodyMedium!.apply(
                    color: theme.colorScheme.background,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
