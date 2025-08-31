abstract class AuthEvent {}

class AuthSignInRequestEvent
    extends AuthEvent {
  String username;
  String password;
  String passwordConfirm;

  AuthSignInRequestEvent(
    this.username,
    this.password,
    this.passwordConfirm,
  );
}

class AuthLoginRequestEvent
    extends AuthEvent {
  String username;
  String password;
  AuthLoginRequestEvent(
    this.username,
    this.password,
  );
}
