import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/forget_pass/domain/use_cases/change_password_usecase.dart';
import 'package:kf_ess_mobile_app/features/forget_pass/domain/use_cases/verify_otp_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/data/local_data.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../data/models/request/forget_pass_request_model.dart';
import '../../domain/use_cases/get_forget_pass_usecase.dart';

part 'forget_pass_state.dart';

@singleton
class ForgetPassCubit extends Cubit<ForgetPassState> {
  final GetForgetPassUseCase getForgetPassUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  String userName = '';
  ForgetPassCubit(
      {required this.getForgetPassUseCase,
      required this.verifyOtpUseCase,
      required this.changePasswordUseCase})
      : super(ForgetPassInitialState());

  Future<void> getForgetPass(
      {required ForgetPassRequestModel forgetPassModel , required bool withNavigation }) async {
    emit(ForgetPassLoadingState());

    // sets the user name to be used in verify otp screen.
    userName = forgetPassModel.userName ?? '';
    final CustomResponseType<BaseEntity<bool>> eitherPackagesOrFailure =
        await getForgetPassUseCase(forgetPassModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ForgetPassErrorState(
        withNavigation: withNavigation,
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<bool> response) {
      if (response.data ?? false) {
        emit(ForgetPassReadyState(response, withNavigation:  withNavigation));
      } else {
        emit(ForgetPassErrorState(message: response.message , withNavigation: withNavigation));
      }
    });
  }

  void getVerifyOtp({required ForgetPassRequestModel forgetPassModel}) async {
    emit(ForgetPassLoadingState());
    final CustomResponseType<BaseEntity<bool>> eitherPackagesOrFailure =
        await verifyOtpUseCase(forgetPassModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ForgetPassVerifyOTPErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<bool> response) {
      if (response.data ?? false) {
        emit(ForgetPassVerifyOTPReadyState(response ));
      } else {
        emit(ForgetPassVerifyOTPErrorState(message: response.message));
      }
    });
  }

  void changePassword({required ForgetPassRequestModel forgetPassModel}) async {
    emit(ForgetPassLoadingState());
    final CustomResponseType<BaseEntity<bool>> eitherPackagesOrFailure =
        await changePasswordUseCase(forgetPassModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ChangePassErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<bool> response) {
      if (response.data??false) {
        LocalData.clearAllData();
        emit(ChangePasswordReadyState(BaseEntity(data: true)));
      } else {
        emit(ChangePassErrorState(message: response.message));
      }
    });
  }
}
