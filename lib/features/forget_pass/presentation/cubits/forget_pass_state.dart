part of 'forget_pass_cubit.dart';

class ForgetPassErrorState extends ForgetPassState {
  final String? message;

  ForgetPassErrorState({this.message});
}

final class ForgetPassInitialState extends ForgetPassState {}

final class ForgetPassLoadingState extends ForgetPassState {}

final class ForgetPassReadyState extends ForgetPassState {
  ForgetPassReadyState(this.response);
    BaseEntity<ForgetPassEntity> response;

}

abstract class ForgetPassState {}
