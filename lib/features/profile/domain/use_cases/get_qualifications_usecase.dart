import 'package:injectable/injectable.dart';
import '../../../../core/domain/usecase/base_usecase.dart';
import '../../../../core/network/base_handling.dart';
import '../../data/models/response/qualifications_response_model.dart';
import '../repositories/profile_repository.dart';
import '../../../shared/entity/base_entity.dart';

@injectable
class GetQualificationsUseCase
    implements UseCaseNoParam<BaseEntity<List<QualificationsModel>>> {
  GetQualificationsUseCase({required this.addQualificationsRepository});

  final ProfileRepository addQualificationsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<QualificationsModel>>>> call() {
    return addQualificationsRepository.getQualifications();
  }
}
