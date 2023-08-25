import 'package:contact/config/assets/images.dart';
import 'package:flutter/material.dart';

class DefaultLoading extends StatelessWidget {
  const DefaultLoading({super.key});

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
            width: width/3,
            height: width/3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AppImages.loadingPage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Loading data...",
            style: theme.textTheme.labelLarge!.apply(
              color: theme.colorScheme.primary
            ),
          )
        ],
      ),
    );
  }
}
