import 'package:dartz/dartz.dart';

abstract class AuthState {}

class AuthInitiateState extends AuthState {}

class AuthSignInRequestState
    extends AuthState {}

class AuthResponseSignInState
    extends AuthState {
  Either<String, String> reponse;
  AuthResponseSignInState(this.reponse);
}

class AuthLodingState extends AuthState {}

class AuthResponseLodingState
    extends AuthState {
  Either<String, String> reponse;
  AuthResponseLodingState(this.reponse);
}
