import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_profile_usecase.dart';
import '../../domain/entities/profile_entity.dart';
import '../../data/models/request/profile_request_model.dart';

part 'profile_state.dart';





@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  ProfileCubit({required this.getProfileUseCase}) : super(ProfileInitialState());

  Future<void> getProfile(
      {required ProfileRequestModel profileModel}) async {
    emit(ProfileLoadingState());

    final CustomResponseType<BaseEntity<ProfileEntity>> eitherPackagesOrFailure =
        await getProfileUseCase(profileModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ProfileErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<ProfileEntity> response) {
      emit(ProfileReadyState(response));
    });
  }
}















