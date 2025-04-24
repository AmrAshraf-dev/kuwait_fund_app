import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/profile_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/use_cases/edit_profile_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRequestUseCase editProfileUseCase;
  EditProfileCubit({required this.editProfileUseCase})
      : super(EditProfileInitialState());

  void createEditProfile(ProfileRequestModel profileRequestModel) async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(EditProfileLoadingState());

    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await editProfileUseCase(profileRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(EditProfileErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      emit(EditProfileReadyState(response));
    });
  }
}
