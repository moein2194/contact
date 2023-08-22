import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contactdetails_event.dart';
part 'contactdetails_state.dart';

class ContactdetailsBloc extends Bloc<ContactdetailsEvent, ContactdetailsState> {
  ContactdetailsBloc() : super(ContactdetailsInitial()) {
    on<ContactdetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
