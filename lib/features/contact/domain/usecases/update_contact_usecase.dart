import 'dart:io';

import 'package:contact/core/network/data_state.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:contact/features/contact/domain/repositories/contact_repository.dart';

class UpdateContactUsecase {
  final ContactRepository repository;

  UpdateContactUsecase({required this.repository});

  Future<DataState<ContactEntity>> call({
    required String contactId,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String note,
    File? picture,
  }) async {
    return repository.updateContact(
      contactId: contactId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      note: note,
      picture: picture,
    );
  }
}
