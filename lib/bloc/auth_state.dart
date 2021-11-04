part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class OnLoginState extends AuthState {}

class OnLoginGoogleState extends AuthState {}

class LoginSuccessState extends AuthState {
  final String message;

  const LoginSuccessState(this.message);
  @override
  List<Object> get props => [message];
}

class LoginFailState extends AuthState {
  final String? message;

  const LoginFailState({this.message});
  @override
  List<Object> get props => [message!];
}

class LogoutState extends AuthState {}
