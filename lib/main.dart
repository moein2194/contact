import 'package:contact/core/dependency/locator.dart';
import 'package:contact/core/global/app_global.dart';
import 'package:contact/core/localStorage/local_storage.dart';
import 'package:contact/core/router/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// locator
  await setup();

  /// initial local storage
  await LocalStorage.initial();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STDev Contact',
      navigatorKey: AppGlobal.navKey,
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routers,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouterKey.splash,
    );
  }
}
