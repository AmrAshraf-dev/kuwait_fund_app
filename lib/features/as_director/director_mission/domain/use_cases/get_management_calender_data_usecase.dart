import 'package:injectable/injectable.dart';
import '../../data/models/request/management_calender_data_request_model.dart';
import "../entities/director_entity.dart";
import '../entities/management_calender_data_entity.dart';

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
