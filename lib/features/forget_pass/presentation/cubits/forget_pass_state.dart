part of 'forget_pass_cubit.dart';

class ForgetPassErrorState extends ForgetPassState {
  final String? message;
  bool withNavigation = false;
  ForgetPassErrorState({this.message  , required this.withNavigation });
}


final class ChangePassErrorState extends ForgetPassState {
  final String? message;

  ChangePassErrorState({this.message});
}

final class ForgetPassVerifyOTPErrorState extends ForgetPassState {
  final String? message;

  ForgetPassVerifyOTPErrorState({this.message});
}
final class ForgetPassInitialState extends ForgetPassState {}

final class ForgetPassLoadingState extends ForgetPassState {}

final class ForgetPassReadyState extends ForgetPassState {
  ForgetPassReadyState(this.response, {required this.withNavigation });
  BaseEntity<bool> response;
  bool withNavigation = false;
}

final class ForgetPassVerifyOTPReadyState extends ForgetPassState {
  ForgetPassVerifyOTPReadyState(this.response  ) ;
  BaseEntity<bool> response;
 }

final class ChangePasswordReadyState extends ForgetPassState {
  ChangePasswordReadyState(this.response);
  BaseEntity<bool> response;
}



abstract class ForgetPassState {}
