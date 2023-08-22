import 'package:equatable/equatable.dart';

abstract class ContactEntity extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? notes;
  final List<String>? picture;
  final String? phone;

  const ContactEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.notes,
    this.picture,
    this.phone,
  });
}
