part of 'contact_bloc.dart';

class ContactState extends Equatable {
  final EventStatus<ContactEntity> createNewContactStatus;
  final EventStatus<ContactEntity> updateContactStatus;
  final EventStatus<bool> deleteContactStatus;

  const ContactState({
    required this.createNewContactStatus,
    required this.deleteContactStatus,
    required this.updateContactStatus,
  });

  @override
  List<Object> get props => [
        createNewContactStatus,
        deleteContactStatus,
        updateContactStatus,
      ];

  ContactState copyWith({
    EventStatus<ContactEntity>? newCreateNewContactStatus,
    EventStatus<ContactEntity>? newUpdateContactStatus,
    EventStatus<bool>? newDeleteContactStatus,
  }) {
    return ContactState(
      createNewContactStatus:
          newCreateNewContactStatus ?? createNewContactStatus,
      deleteContactStatus: newDeleteContactStatus ?? deleteContactStatus,
      updateContactStatus: newUpdateContactStatus ?? updateContactStatus,
    );
  }
}
