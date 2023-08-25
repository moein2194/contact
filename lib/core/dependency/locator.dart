import 'package:contact/core/global/app_global.dart';
import 'package:contact/core/localStorage/local_storage.dart';
import 'package:contact/features/contact/data/datasources/contact_api_provider.dart';
import 'package:contact/features/contact/data/repositories/contact_repository_lmpl.dart';
import 'package:contact/features/contact/domain/repositories/contact_repository.dart';
import 'package:contact/features/contact/domain/usecases/create_new_contact_usecase.dart';
import 'package:contact/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:contact/features/home/data/datasources/home_api_provider.dart';
import 'package:contact/features/home/data/repositories/home_repository_lmpl.dart';
import 'package:contact/features/home/domain/repositories/home_repository.dart';
import 'package:contact/features/home/domain/usecases/get_all_contacts_usecase.dart';
import 'package:contact/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {
  /// app global
  locator.registerSingleton<AppGlobal>(AppGlobal());

  /// local storage
  locator.registerSingleton<LocalStorage>(LocalStorage());

  /// providers
  locator.registerSingleton<HomeApiProvider>(HomeApiProvider());
  locator.registerSingleton<ContactApiProvider>(ContactApiProvider());

  /// repositories
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(locator()));
  locator.registerSingleton<ContactRepository>(
      ContactRepositoryImpl(apiProvider: locator()));

  /// usecases
  locator.registerSingleton<GetAllContactsUsecase>(
      GetAllContactsUsecase(locator()));
  locator.registerSingleton<CreateNewContactUsecase>(
      CreateNewContactUsecase(repository: locator()));

  /// state management
  locator.registerSingleton<HomeBloc>(
    HomeBloc(
      allContactsUsecase: locator(),
    ),
  );
  locator.registerSingleton<ContactBloc>(
    ContactBloc(
      newContactUsecase: locator(),
    ),
  );
}
