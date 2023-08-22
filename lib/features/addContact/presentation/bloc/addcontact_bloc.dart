import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'addcontact_event.dart';
part 'addcontact_state.dart';

class AddcontactBloc extends Bloc<AddcontactEvent, AddcontactState> {
  AddcontactBloc() : super(AddcontactInitial()) {
    on<AddcontactEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
