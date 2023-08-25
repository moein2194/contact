import 'package:contact/core/network/data_state.dart';
import 'package:contact/features/contact/data/models/contact_model.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:contact/features/home/data/datasources/home_api_provider.dart';
import 'package:contact/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeApiProvider apiProvider;

  HomeRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<List<ContactEntity>>> getAllContacts() async {
    try {
      var response = await apiProvider.getContactsList();
      if (response.$1 != null) {
        return DataSuccess(
          List.from(
            (response.$1 as List).map(
              (e) => ContactModel.fromJson(e),
            ),
          ),
        );
      } else {
        return DataFailed(response.$2!);
      }
    } catch (e) {
      return const DataFailed("Please check your internet...");
    }
  }
}
