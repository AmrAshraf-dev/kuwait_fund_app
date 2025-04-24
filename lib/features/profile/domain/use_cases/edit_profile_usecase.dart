import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/profile_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';

@injectable
class EditProfileRequestUseCase
    implements UseCase<BaseEntity<String>, ProfileRequestModel> {
  EditProfileRequestUseCase({required this.editProfileRequestRepository});

  final ProfileRepository editProfileRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<String>>> call(
    ProfileRequestModel profileRequestModel,
  ) {
    return editProfileRequestRepository.editProfile(
        profileRequestModel: profileRequestModel);
  }
}
