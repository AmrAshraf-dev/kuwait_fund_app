import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/domain/usecase/base_usecase.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/experiences_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

@injectable
class GetExperiencesUseCase
    implements UseCaseNoParam<BaseEntity<List<ExperiencesModel>>> {
  GetExperiencesUseCase({required this.addExperiencesRepository});

  final ProfileRepository addExperiencesRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<ExperiencesModel>>>> call() {
    return addExperiencesRepository.getExperiences();
  }
}
