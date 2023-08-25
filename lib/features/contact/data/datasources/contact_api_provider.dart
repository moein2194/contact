import 'dart:io';

import 'package:contact/core/network/http_request_handler.dart';
import 'package:contact/core/network/http_urls.dart';
import 'package:dio/dio.dart';

class ContactApiProvider {
  Future<(Map<String, dynamic>?, String?)> createNewContact({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String note,
    File? picture,
  }) async {
    Map<String, dynamic>? data = {};
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["email"] = email;
    data["phone"] = phone;
    data["notes"] = note;
    if (picture != null) {
      data["picture"] = List.generate(
          1,
          (index) async => await MultipartFile.fromFile(picture.path,
              filename: picture.path.split('/').last));
    }
    return await HttpRequestHanlder.post(
      UrlPathKey.contacts,
      data: FormData.fromMap(data),
    );
  }

  Future<(Map<String, dynamic>?, String?)> deleteContact({
    required String contactId,
    File? picture,
  }) async {
    return await HttpRequestHanlder.delete(
      UrlPathKey.contactByID(contactId),
    );
  }

  Future<(Map<String, dynamic>?, String?)> updateContact({
    required String contactId,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String note,
    File? picture,
  }) async {
    Map<String, dynamic>? data = {};
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["email"] = email;
    data["phone"] = phone;
    data["notes"] = note;
    if (picture != null) {
      data["picture"] = List.generate(
          1,
          (index) async => await MultipartFile.fromFile(picture.path,
              filename: picture.path.split('/').last));
    }
    return await HttpRequestHanlder.put(
      UrlPathKey.contactByID(contactId),
      data: FormData.fromMap(data),
    );
  }


}
