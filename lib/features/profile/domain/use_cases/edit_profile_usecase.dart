import 'package:injectable/injectable.dart';
import '../../data/models/request/profile_request_model.dart';
import '../repositories/profile_repository.dart';
import '../../../shared/entity/base_entity.dart';

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
