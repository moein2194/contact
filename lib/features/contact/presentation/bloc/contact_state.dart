part of 'contact_bloc.dart';

class ContactState extends Equatable {
  final EventStatus<ContactEntity> createNewContactStatus;

  const ContactState({
    required this.createNewContactStatus,
  });

  @override
  List<Object> get props => [
        createNewContactStatus,
      ];

  ContactState copyWith({
    EventStatus<ContactEntity>? newCreateNewContactStatus,
  }) {
    return ContactState(
      createNewContactStatus:
          newCreateNewContactStatus ?? createNewContactStatus,
    );
  }
}
