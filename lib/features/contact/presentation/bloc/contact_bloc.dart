import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:contact/core/models/event_status.dart';
import 'package:contact/core/network/data_state.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:contact/features/contact/domain/usecases/create_new_contact_usecase.dart';
import 'package:contact/features/contact/domain/usecases/delete_contact_usecase.dart';
import 'package:contact/features/contact/domain/usecases/update_contact_usecase.dart';
import 'package:equatable/equatable.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final CreateNewContactUsecase newContactUsecase;
  final DeleteContactUsecase deleteContactUsecase;
  final UpdateContactUsecase updateContactUsecase;

  ContactBloc({
    required this.newContactUsecase,
    required this.deleteContactUsecase,
    required this.updateContactUsecase,
  }) : super(ContactState(
          createNewContactStatus: EventInitial(),
          deleteContactStatus: EventInitial(),
          updateContactStatus: EventInitial(),
        )) {
    on<CreateContactEvent>((event, emit) async {
      emit(
        state.copyWith(
          newCreateNewContactStatus: EventLoading(),
        ),
      );

      DataState result = await newContactUsecase(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        phone: event.phone,
        note: event.note,
        picture: event.picture,
      );

      if (result is DataSuccess) {
        return emit(state.copyWith(
            newCreateNewContactStatus: EventCompleted(result.data)));
      }
      if (result is DataFailed) {
        return emit(state.copyWith(
            newCreateNewContactStatus: EventError(result.error!)));
      }
    });

    on<DeleteContactEvent>((event, emit) async {
      emit(state.copyWith(newDeleteContactStatus: EventLoading()));

      DataState result = await deleteContactUsecase(
        contactId: event.contactId,
      );

      if (result is DataSuccess) {
        return emit(state.copyWith(
            newDeleteContactStatus: EventCompleted(result.data)));
      }
      if (result is DataFailed) {
        return emit(state.copyWith(
          newDeleteContactStatus: EventError(result.error!),
        ));
      }
    });

    on<UpdateContactEvent>((event, emit) async {
      emit(state.copyWith(newUpdateContactStatus: EventLoading()));

      DataState result = await updateContactUsecase(
        contactId: event.contactId,
        email: event.email,
        firstName: event.firstName,
        lastName: event.lastName,
        phone: event.phone,
        note: event.note,
        picture: event.picture,
      );

      if (result is DataSuccess) {
        return emit(state.copyWith(
            newUpdateContactStatus: EventCompleted(result.data)));
      }
      if (result is DataFailed) {
        return emit(
            state.copyWith(newUpdateContactStatus: EventError(result.error!)));
      }
    });
  }
}
