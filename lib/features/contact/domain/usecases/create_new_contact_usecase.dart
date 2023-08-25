import 'dart:io';

import 'package:contact/core/network/data_state.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:contact/features/contact/domain/repositories/contact_repository.dart';

class CreateNewContactUsecase {
  final ContactRepository repository;

  CreateNewContactUsecase({required this.repository});

  Future<DataState<ContactEntity>> call(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String note,
      File? picture}) async {
    return repository.createNewContact(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      note: note,
      picture: picture,
    );
  }
}
