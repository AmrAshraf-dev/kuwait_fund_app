import 'package:kf_ess_mobile_app/features/profile/data/models/request/spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/spouse_entity.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import "../repositories/profile_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';

@injectable
class GetSpouseUseCase
    implements UseCase<BaseEntity<SpouseEntity>, SpouseRequestModel> {
  GetSpouseUseCase({required this.spouseRepository});

  final ProfileRepository spouseRepository;

  @override
  Future<CustomResponseType<BaseEntity<SpouseEntity>>> call(
    SpouseRequestModel params,
  ) {
    return spouseRepository.getSpouse(spouseParams: params);
  }
}
