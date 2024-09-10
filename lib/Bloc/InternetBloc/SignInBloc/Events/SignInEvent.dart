abstract class SignInEvent {}

class ValidateEvent extends SignInEvent {
  String Email;
  String Password;
  ValidateEvent(
    this.Email,
    this.Password,
  );
}

class SubmitEvent extends SignInEvent {
  String Email;
  String Password;
  SubmitEvent(
    this.Email,
    this.Password,
  );
}
