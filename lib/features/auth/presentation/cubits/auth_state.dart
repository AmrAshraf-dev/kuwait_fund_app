part of 'auth_cubit.dart';

class AuthErrorState extends AuthState {
  final String? message;

  AuthErrorState({this.message});
}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthReadyState extends AuthState {
  AuthReadyState(this.response);
    BaseEntity<AuthEntity> response;

}

abstract class AuthState {}
