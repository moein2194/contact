part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class GetAllContactsEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class InitialGetAllContactsEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class AddNewContactToListEvent extends HomeEvent {
  final ContactEntity newContact;

  AddNewContactToListEvent({required this.newContact});

  @override
  List<Object?> get props => [
        newContact,
      ];
}

class RemoveContactFromList extends HomeEvent {
  final String id;

  RemoveContactFromList({required this.id});

  @override
  List<Object?> get props => [
        id,
      ];
}

class UpdateContactFromListEvent extends HomeEvent {
  final ContactEntity contact;

  UpdateContactFromListEvent({required this.contact});
  
  @override
  List<Object?> get props => [
    contact,
  ];
}
