import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/base_handling.dart';
import '../../../../error/failure.dart';
import '../../data/models/request/profile_request_model.dart';
import '../../domain/use_cases/edit_profile_usecase.dart';
import '../../../shared/entity/base_entity.dart';

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
