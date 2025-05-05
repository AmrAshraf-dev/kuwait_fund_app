import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/main_profile_entity.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_profile_usecase.dart';
import '../../domain/entities/profile_entity.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  ProfileCubit({required this.getProfileUseCase})
      : super(ProfileInitialState());

  Future<void> getProfile(/*{ProfileRequestModel? profileModel}*/) async {
    emit(ProfileLoadingState());

    final CustomResponseType<BaseEntity<MainProfileEntity>>
        eitherPackagesOrFailure = await getProfileUseCase(/*profileModel!*/);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ProfileErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<MainProfileEntity> response) {
      emit(ProfileReadyState(response));
    });
  }
}
