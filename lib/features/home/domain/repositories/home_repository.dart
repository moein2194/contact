import 'package:contact/core/network/data_state.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';

abstract class HomeRepository {
  Future<DataState<List<ContactEntity>>> getAllContacts();
}
