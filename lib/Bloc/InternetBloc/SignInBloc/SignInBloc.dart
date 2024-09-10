import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_learnings/Bloc/InternetBloc/SignInBloc/Events/SignInEvent.dart';
import 'package:my_learnings/Bloc/InternetBloc/SignInBloc/States/SignInState.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(InitialState()) {
    // Validate Event
    on<ValidateEvent>((event, emit) {
      if (event.Email == "" || !event.Email.contains("@gmail.com")) {
        emit(ErrorState("Please Enter The Valid Email"));
      } else if (event.Password.length < 6) {
        emit(ErrorState("Password Length Should be At least 6"));
      } else {
        emit(ValidState());
      }
    });

    // Submit Event

    on<SubmitEvent>(
      (event, emit) {
        emit(LoadingState());
      },
    );
  }
}
