import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fnews/models/models.dart';
import 'package:fnews/services/services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(OnLoginState());
      } else if (event is LoginProcess) {
        ReturnValue result =
            await AuthServices.loginWithEmail(event.email, event.password);
        if (result.value != null) {
          emit(LoginSuccessState(result.value));
        } else {
          emit(LoginFailState(message: result.message));
        }
      } else if (event is LogoutEvent) {
        await AuthServices.logOut();
        emit(LogoutState());
      } else if (event is LoginGoogleEvent) {
        emit(OnLoginGoogleState());
        await Future.delayed(const Duration(seconds: 1));
        ReturnValue result = await AuthServices.loginWithGoogle();

        if (result.value != null) {
          emit(LoginSuccessState(result.value));
        } else {
          emit(LoginFailState(message: result.message));
        }
      }
    });
  }
}
