import 'package:injectable/injectable.dart';
import '../../../../core/domain/usecase/base_usecase.dart';
import '../../../../core/network/base_handling.dart';
import '../../data/models/request/edit_child_request_model.dart';
import '../repositories/profile_repository.dart';
import '../../../shared/entity/base_entity.dart';

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
