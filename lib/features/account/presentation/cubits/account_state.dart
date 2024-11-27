part of 'account_cubit.dart';

class AccountErrorState extends AccountState {
  final String? message;

  AccountErrorState({this.message});
}

final class AccountInitialState extends AccountState {}

final class AccountLoadingState extends AccountState {}

final class AccountReadyState extends AccountState {
  AccountReadyState(this.response);
    BaseEntity<AccountEntity> response;

}

abstract class AccountState {}
