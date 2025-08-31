import 'package:store_app/bloc/authentication/auth_event.dart';
import 'package:store_app/bloc/authentication/auth_state.dart';
import 'package:bloc/bloc.dart';
import 'package:store_app/data/repository/authentication_repository.dart';
import 'package:store_app/di/di.dart';

class AuthBloc
    extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository = locator
      .get();

  AuthBloc() : super(AuthInitiateState()) {
    on<AuthSignInRequestEvent>((
      event,
      emit,
    ) async {
      emit(AuthSignInRequestState());
        var reponse = await _repository.rgister(
        event.username,
        event.password,
        event.passwordConfirm
      );
      emit(AuthResponseSignInState(reponse));
    });

    on<AuthLoginRequestEvent>((
      event,
      emit,
    ) async {
      emit(AuthLodingState());
      var reponse = await _repository.login(
        event.username,
        event.password,
      );
      emit(AuthResponseLodingState(reponse));
    });
  }
}
