import 'package:contact/config/assets/images.dart';
import 'package:contact/core/router/app_router.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void navToMain() {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        AppRouter.pushReplacement(RouterKey.home);
      },
    );
  }

  @override
  void initState() {
    navToMain();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.primary,
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImages.appIcon,
              ),
            ),
            Column(
              children: [
                Text(
                  "Contact App",
                  style: themeData.textTheme.headlineLarge!.apply(
                    color: themeData.colorScheme.background,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Your contacts are securely backed up and synced across all your devices.",
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.labelMedium!.apply(
                    color: themeData.colorScheme.background,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: themeData.colorScheme.background,
                strokeWidth: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
