import 'package:contact/config/styles/app_theme.dart';
import 'package:contact/core/dependency/locator.dart';
import 'package:contact/core/global/app_global.dart';
import 'package:contact/core/localStorage/local_storage.dart';
import 'package:contact/core/router/app_router.dart';
import 'package:contact/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:contact/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (homeContext) => locator<HomeBloc>(),
        ),
        BlocProvider(
          create: (contactContext) => locator<ContactBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'STDev Contact',
        navigatorKey: AppGlobal.navKey,
        debugShowCheckedModeBanner: false,
        routes: AppRouter.routers,
        onGenerateRoute: AppRouter.generateRoute,
        theme: ThemeData(
            useMaterial3: true, colorScheme: AppTheme.lightColorScheme),
        darkTheme: ThemeData(
            useMaterial3: true, colorScheme: AppTheme.darkColorScheme),
        initialRoute: RouterKey.splash,
      ),
    );
  }
}
