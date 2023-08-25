import 'package:bloc/bloc.dart';
import 'package:contact/core/models/event_status.dart';
import 'package:contact/core/network/data_state.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:contact/features/home/domain/usecases/get_all_contacts_usecase.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllContactsUsecase allContactsUsecase;

  HomeBloc({
    required this.allContactsUsecase,
  }) : super(HomeState(
          contactsListStatus: EventInitial(),
        )) {
    on<InitialGetAllContactsEvent>((event, emit) {
      emit(state.copyWith(newContactsListStatus: EventInitial()));
    });
    on<GetAllContactsEvent>((event, emit) async {
      emit(state.copyWith(newContactsListStatus: EventLoading()));

      DataState result = await allContactsUsecase();
      if (result is DataSuccess) {
        return emit(
            state.copyWith(newContactsListStatus: EventCompleted(result.data)));
      }
      if (result is DataFailed) {
        return emit(
            state.copyWith(newContactsListStatus: EventError(result.error!)));
      }
    });
    on<AddNewContactToListEvent>((event, emit) {
      List<ContactEntity> contacts = List.empty();
      if (state.contactsListStatus is EventCompleted) {
        contacts = (state.contactsListStatus as EventCompleted).data;
      }
      contacts.add(event.newContact);
      return emit(state.copyWith(
        newContactsListStatus: EventCompleted(contacts),
      ));
    });
    on<RemoveContactFromList>((event, emit) {
      List<ContactEntity> contacts = List.empty();
      if (state.contactsListStatus is EventCompleted) {
        contacts = (state.contactsListStatus as EventCompleted).data;
      }
      contacts.removeWhere(
        (element) => element.id == event.id,
      );
      return emit(state.copyWith(
        newContactsListStatus: EventCompleted(contacts),
      ));
    });

    on<UpdateContactFromListEvent>((event, emit) {
      List<ContactEntity> contacts = List.empty();
      if (state.contactsListStatus is EventCompleted) {
        contacts = (state.contactsListStatus as EventCompleted).data;
      }
      contacts.removeWhere(
        (element) => element.id == event.contact.id,
      );
      contacts.add(event.contact);
      return emit(state.copyWith(
        newContactsListStatus: EventCompleted(contacts),
      ));
    });
  }
}
