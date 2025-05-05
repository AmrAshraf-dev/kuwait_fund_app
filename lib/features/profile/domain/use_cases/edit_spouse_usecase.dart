import 'package:injectable/injectable.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../data/models/request/edit_spouse_request_model.dart';
import '../repositories/profile_repository.dart';

@injectable
class SpouseRequestUseCase
    implements UseCase<BaseEntity<String>, EditSpouseRequestModel> {
  SpouseRequestUseCase({required this.editSpouseRequestRepository});

  final ProfileRepository editSpouseRequestRepository;

  @override
  Future<CustomResponseType<BaseEntity<String>>> call(
    EditSpouseRequestModel editSpouseRequestModel,
  ) {
    return editSpouseRequestRepository.editSpouse(
        editSpouseRequestModel: editSpouseRequestModel);
  }
}
