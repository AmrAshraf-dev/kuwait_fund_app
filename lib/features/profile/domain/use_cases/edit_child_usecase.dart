import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/domain/usecase/base_usecase.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_child_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

@injectable
class EditChildRequestUseCase
    implements UseCase<BaseEntity<String>, EditChildRequestModel> {
  EditChildRequestUseCase({required this.editChildRequestRepository});

  final ProfileRepository editChildRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<String>>> call(
    EditChildRequestModel editChildRequestModel,
  ) {
    return editChildRequestRepository.editChild(
        editChildRequestModel: editChildRequestModel);
  }
}
