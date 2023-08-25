import 'package:contact/core/network/data_state.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:contact/features/home/domain/repositories/home_repository.dart';

class GetAllContactsUsecase {
  final HomeRepository repository;

  GetAllContactsUsecase(this.repository);

  Future<DataState<List<ContactEntity>>> call() async {
    return await repository.getAllContacts();
  }
}
