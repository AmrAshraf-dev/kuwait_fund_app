import 'package:injectable/injectable.dart';
import '../../data/models/request/director_mission_details_request_model.dart';
import '../entities/director_mission_details_entity.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
  import "../repositories/director_home_repository.dart";

@injectable
class GetDirectorMissionsDetailsUseCase
    implements UseCase<BaseEntity<List<DirectorMissionDetailsEntity>>, DirectorMissionDetailsRequestModel> {
  GetDirectorMissionsDetailsUseCase({required this.adminHomeRepository});

  final AdminHomeRepository adminHomeRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<DirectorMissionDetailsEntity>>>> call(
    DirectorMissionDetailsRequestModel directorMissionDetailsRequestModel
  ) {
    return adminHomeRepository.getDirectorMissionsDetails(directorMissionDetailsRequestModel);
  }
}
