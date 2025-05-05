import 'package:injectable/injectable.dart';
import '../../../../core/domain/usecase/base_usecase.dart';
import '../../../../core/network/base_handling.dart';
import '../../data/models/response/experiences_response_model.dart';
import '../repositories/profile_repository.dart';
import '../../../shared/entity/base_entity.dart';

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
