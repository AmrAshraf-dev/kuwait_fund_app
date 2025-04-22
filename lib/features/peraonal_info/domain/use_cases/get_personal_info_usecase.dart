import 'package:kf_ess_mobile_app/features/peraonal_info/domain/entities/personal_info_entity.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import "../repositories/personal_info_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';

@injectable
class GetPersonalInfoUseCase
    implements UseCaseNoParam<BaseEntity<PersonalInfoEntity>> {
  GetPersonalInfoUseCase({required this.personalInfoRepository});

  final PersonalInfoRepository personalInfoRepository;

  @override
  Future<CustomResponseType<BaseEntity<PersonalInfoEntity>>> call() {
    return personalInfoRepository.getPersonalInfo();
  }
}
