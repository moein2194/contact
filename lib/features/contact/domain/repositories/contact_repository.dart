import 'dart:io';

import 'package:contact/core/network/data_state.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';

abstract class ContactRepository {
  Future<DataState<ContactEntity>> createNewContact({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String note,
    File? picture,
  });
}
