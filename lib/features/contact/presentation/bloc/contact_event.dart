part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {}

class CreateContactEvent extends ContactEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String note;
  final File? picture;

  CreateContactEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.note,
    this.picture,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        phone,
        note,
        picture,
      ];
}

class DeleteContactEvent extends ContactEvent {
  final String contactId;

  DeleteContactEvent({required this.contactId});

  @override
  List<Object?> get props => [
        contactId,
      ];
}

class UpdateContactEvent extends ContactEvent {
  final String contactId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String note;
  final File? picture;

  UpdateContactEvent({
    required this.contactId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.note,
    this.picture,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        phone,
        note,
        picture,
      ];
}
