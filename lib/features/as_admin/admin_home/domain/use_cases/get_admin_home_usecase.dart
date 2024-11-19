import 'package:injectable/injectable.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import "../../data/models/request/admin_home_request_model.dart";
import "../entities/admin_home_entity.dart";
import "../repositories/admin_home_repository.dart";

@injectable
class GetAdminHomeUseCase
    implements UseCase<BaseEntity<AdminHomeEntity>, AdminHomeRequestModel> {
  GetAdminHomeUseCase({required this.adminHomeRepository});

  final AdminHomeRepository adminHomeRepository;

  @override
  Future<CustomResponseType<BaseEntity<AdminHomeEntity>>> call(
    AdminHomeRequestModel params,
  ) {
    return adminHomeRepository.getAdminHome(adminHomeParams: params);
  }
}
