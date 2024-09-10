abstract class SignInState {}

class InitialState extends SignInState {}

class ErrorState extends SignInState {
  String Error;
  ErrorState(this.Error);
}

class ValidState extends SignInState {}

class LoadingState extends SignInState {}
