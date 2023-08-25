import 'package:contact/core/network/data_state.dart';
import 'package:contact/features/contact/domain/repositories/contact_repository.dart';

class DeleteContactUsecase {
  final ContactRepository repository;

  DeleteContactUsecase({required this.repository});

  Future<DataState<bool>> call({required String contactId})async {
    return await repository.deleteContact(contactId: contactId);
  }
}
