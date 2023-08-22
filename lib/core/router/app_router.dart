import 'package:contact/core/global/app_global.dart';
import 'package:contact/core/router/screen_arguments.dart';
import 'package:contact/features/auth/presentation/pages/auth_page.dart';
import 'package:contact/features/contact/presentation/pages/add_contact_page.dart';
import 'package:contact/features/contact/presentation/pages/contact_details_page.dart';
import 'package:contact/features/contact/presentation/pages/edit_contact_page.dart';
import 'package:contact/features/home/presentation/pages/home_page.dart';
import 'package:contact/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static Map<String, Widget Function(BuildContext)> routers = {
    RouterKey.home: (context) => const HomePage(),
    RouterKey.splash: (context) => const SplashPage(),
    RouterKey.addContact: (context) => const AddContactPage(),
    RouterKey.editContact: (context) => const EditContantPage(),
    RouterKey.contactDetails: (context) => const ContactDetialsPage(),
    RouterKey.auth: (context) => const AuthPage(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterKey.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      case RouterKey.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
      case RouterKey.addContact:
        return MaterialPageRoute(
          builder: (_) => const AddContactPage(),
          settings: settings,
        );
      case RouterKey.editContact:
        return MaterialPageRoute(
          builder: (_) => const EditContantPage(),
          settings: settings,
        );
      case RouterKey.contactDetails:
        return MaterialPageRoute(
          builder: (_) => const ContactDetialsPage(),
          settings: settings,
        );
      case RouterKey.auth:
        return MaterialPageRoute(
          builder: (_) => const AuthPage(),
          settings: settings,
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text("Page not found!"),
        ),
      );
    });
  }

  static ScreenArguments<T> getArgument<T>(BuildContext context) {
    ScreenArguments<T> argument =
        ModalRoute.of(context)!.settings.arguments is ScreenArguments<T>
            ? (ModalRoute.of(context)!.settings.arguments as ScreenArguments<T>)
            : ScreenArguments<T>();
    return argument;
  }

  static void pop<T extends Object?>({
    T? argument,
    bool rootNavigator = false,
  }) {
    if (rootNavigator) {
      Navigator.of(
        AppGlobal.navKey.currentState!.context,
        rootNavigator: rootNavigator,
      ).pop(
        ScreenArguments(data: argument),
      );
    } else {
      Navigator.pop(
        AppGlobal.navKey.currentState!.context,
        ScreenArguments(data: argument),
      );
    }
  }

  static Future<T?> push<T extends Object?>(
    String? pageName, {
    T? argument,
  }) async {
    return await Navigator.pushNamed(
      AppGlobal.navKey.currentState!.context,
      pageName!,
      arguments: ScreenArguments(
        data: argument,
      ),
    );
  }

  static Future<T?> pushReplacement<T extends Object?>(
    String? pageName, {
    T? argument,
  }) async {
    return await Navigator.pushReplacementNamed(
        AppGlobal.navKey.currentState!.context, pageName!,
        arguments: ScreenArguments(data: argument));
  }

  static Future<T?> popAndPush<T extends Object?>(
    String? pageName, {
    T? argument,
  }) async {
    return await Navigator.popAndPushNamed(
        AppGlobal.navKey.currentState!.context, pageName!,
        arguments: ScreenArguments(data: argument));
  }

  static void popUntil<T extends Object?>(
    bool Function(Route<dynamic>) predicate,
  ) {
    Navigator.popUntil(AppGlobal.navKey.currentState!.context, predicate);
  }

  static bool canPop() {
    return Navigator.canPop(
      AppGlobal.navKey.currentState!.context,
    );
  }
}

class RouterKey {
  static const String home = "/home";
  static const String splash = "/splash";
  static const String contactDetails = "/contact_details";
  static const String editContact = "/edit_contact";
  static const String addContact = "/add_contact";
  static const String auth = "/auth";
}
