import 'package:injectable/injectable.dart';
import "package:kf_ess_mobile_app/features/as_director/director_home_mission/domain/entities/director_entity.dart";

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
  import "../repositories/director_home_repository.dart";

@injectable
class GetDirectorsListUseCase
    implements UseCaseNoParam<BaseEntity<List<DirectorEntity>>> {
  GetDirectorsListUseCase({required this.adminHomeRepository});

  final AdminHomeRepository adminHomeRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<DirectorEntity>>>> call(
    
  ) {
    return adminHomeRepository.getDirectorsList();
  }
}
