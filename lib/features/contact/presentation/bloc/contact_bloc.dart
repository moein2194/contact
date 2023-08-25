import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:contact/core/models/event_status.dart';
import 'package:contact/core/network/data_state.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:contact/features/contact/domain/usecases/create_new_contact_usecase.dart';
import 'package:equatable/equatable.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final CreateNewContactUsecase newContactUsecase;

  ContactBloc({
    required this.newContactUsecase,
  }) : super(ContactState(
          createNewContactStatus: EventInitial(),
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
  }
}
