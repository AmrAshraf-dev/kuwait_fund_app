import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_home_mission/data/models/request/management_calender_data_request_model.dart';
import "package:kf_ess_mobile_app/features/as_director/director_home_mission/domain/entities/director_entity.dart";
import 'package:kf_ess_mobile_app/features/as_director/director_home_mission/domain/entities/management_calender_data_entity.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
  import "../repositories/director_home_repository.dart";

@injectable
class GetManagementCalenderDataUseCase
    implements UseCase<BaseEntity<List<ManagementCalenderDataEntity>>, ManagementCalenderDataRequestModel> {
  GetManagementCalenderDataUseCase({required this.adminHomeRepository});

  final AdminHomeRepository adminHomeRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<ManagementCalenderDataEntity>>>> call(
    ManagementCalenderDataRequestModel managementCalenderDataRequestModel,
  ) {
    return adminHomeRepository.getManagementCalenderData(
      managementCalenderDataRequestModel,
    );
  }
}
