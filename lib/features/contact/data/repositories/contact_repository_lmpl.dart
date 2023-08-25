import 'dart:io';

import 'package:contact/core/network/data_state.dart';
import 'package:contact/features/contact/data/datasources/contact_api_provider.dart';
import 'package:contact/features/contact/data/models/contact_model.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:contact/features/contact/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl extends ContactRepository {
  final ContactApiProvider apiProvider;

  ContactRepositoryImpl({
    required this.apiProvider,
  });

  @override
  Future<DataState<ContactEntity>> createNewContact(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String note,
      File? picture}) async {
    try {
      var response = await apiProvider.createNewContact(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        note: note,
        picture: picture,
      );

      if (response.$1 != null) {
        return DataSuccess(ContactModel.fromJson(response.$1!));
      } else {
        return DataFailed(response.$2!);
      }
    } catch (e) {
      return const DataFailed("Please check your internet connection");
    }
  }

  @override
  Future<DataState<bool>> deleteContact({required String contactId}) async {
    try {
      var response = await apiProvider.deleteContact(contactId: contactId);

      if (response.$1 != null) {
        return const DataSuccess(true);
      } else {
        return DataFailed(response.$2!);
      }
    } catch (e) {
      return const DataFailed("Please check your internet connection");
    }
  }

  @override
  Future<DataState<ContactEntity>> updateContact({
    required String contactId,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String note,
    File? picture,
  }) async {
    try {
      var response = await apiProvider.updateContact(
        contactId: contactId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        note: note,
        picture: picture,
      );

      if (response.$1 != null) {
        return DataSuccess(ContactModel.fromJson(response.$1!));
      } else {
        return DataFailed(response.$2!);
      }
    } catch (e) {
      return const DataFailed("Please check your internet connection");
    }
  }
}
