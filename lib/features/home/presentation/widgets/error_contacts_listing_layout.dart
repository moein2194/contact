import 'package:contact/config/assets/images.dart';
import 'package:flutter/material.dart';

class ErrorCotactsListingLayout extends StatelessWidget {
  final VoidCallback onPressedTryAgain;
  const ErrorCotactsListingLayout({
    super.key,
    required this.onPressedTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    ThemeData theme = Theme.of(context);
    return SizedBox(
      width: double.maxFinite,
      height: width/2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: width / 3,
            height: width / 3,
            child: Image.asset(
              AppImages.somthingWentWrong,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: onPressedTryAgain,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
            ),
            child: const Text("try again"),
          ),
        ],
      ),
    );
  }
}
