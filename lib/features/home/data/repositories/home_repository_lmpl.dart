import 'package:contact/core/network/data_state.dart';
import 'package:contact/features/home/data/datasources/home_api_provider.dart';
import 'package:contact/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeApiProvider apiProvider;

  HomeRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<Map<String, dynamic>>> getAllContacts() async {
    try {
      var response = await apiProvider.getContactsList();
      if (response.$1 != null) {
        return DataSuccess(response.$1);
      } else {
        return DataFailed(response.$2!);
      }
    } catch (e) {
      return const DataFailed("Please check your internet...");
    }
  }
}
