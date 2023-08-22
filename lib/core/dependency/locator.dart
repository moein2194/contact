import 'package:contact/core/global/app_global.dart';
import 'package:contact/core/localStorage/local_storage.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {
  /// app global
  locator.registerSingleton<AppGlobal>(AppGlobal());
  
  /// local storage
    locator.registerSingleton<LocalStorage>(LocalStorage());

    
}

