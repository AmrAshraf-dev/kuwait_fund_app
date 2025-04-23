import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/domain/usecase/base_usecase.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/qualifications_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

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
