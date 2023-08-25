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
  }
}
