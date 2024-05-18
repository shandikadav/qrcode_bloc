part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthStateLogin extends AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthStateLogout extends AuthState {}

final class AuthStateRegister extends AuthState {}

final class AuthStateError extends AuthState {
  final String message;

  AuthStateError(this.message);
}
