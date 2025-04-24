import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';

@injectable
class EditSpouseRequestUseCase
    implements UseCase<BaseEntity<String>, EditSpouseRequestModel> {
  EditSpouseRequestUseCase({required this.editSpouseRequestRepository});

  final ProfileRepository editSpouseRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<String>>> call(
    EditSpouseRequestModel editSpouseRequestModel,
  ) {
    return editSpouseRequestRepository.editSpouse(
        editSpouseRequestModel: editSpouseRequestModel);
  }
}
