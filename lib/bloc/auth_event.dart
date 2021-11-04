part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LaunchAppEvent extends AuthEvent {}

class AuthCheckEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {}

class LoginGoogleEvent extends AuthEvent {}

class LoginProcess extends AuthEvent {
  final String email;
  final String password;

  const LoginProcess(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class LogoutEvent extends AuthEvent {}
