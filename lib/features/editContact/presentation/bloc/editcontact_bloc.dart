import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'editcontact_event.dart';
part 'editcontact_state.dart';

class EditcontactBloc extends Bloc<EditcontactEvent, EditcontactState> {
  EditcontactBloc() : super(EditcontactInitial()) {
    on<EditcontactEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
