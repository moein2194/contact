part of 'home_bloc.dart';

class HomeState extends Equatable {
  final EventStatus<List<ContactEntity>> contactsListStatus;

  const HomeState({
    required this.contactsListStatus,
  });

  @override
  List<Object> get props => [
        contactsListStatus,
      ];

  HomeState copyWith({
    EventStatus<List<ContactEntity>>? newContactsListStatus,
  }) {
    return HomeState(
      contactsListStatus: newContactsListStatus ?? contactsListStatus,
    );
  }
}
