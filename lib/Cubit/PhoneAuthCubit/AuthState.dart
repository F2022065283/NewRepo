abstract class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class VerifiedState extends AuthState {}

class ErrorState extends AuthState {
  String Error;

  ErrorState(this.Error);
}

class CodeSentState extends AuthState {}

class LoggedInState extends AuthState {}

class LoggedOutState extends AuthState {}
