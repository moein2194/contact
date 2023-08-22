import 'package:contact/core/network/data_state.dart';

abstract class HomeRepository {
  Future<DataState<Map<String,dynamic>>> getAllContacts();
}
