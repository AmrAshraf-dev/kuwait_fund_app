import 'package:kf_ess_mobile_app/features/profile/domain/entities/main_profile_entity.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import "../entities/profile_entity.dart";
import "../repositories/profile_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';

@injectable
class GetProfileUseCase implements UseCaseNoParam<BaseEntity<MainProfileEntity> //ProfileRequestModel
> {
  GetProfileUseCase({required this.profileRepository});

  final ProfileRepository profileRepository;

  @override
  Future<CustomResponseType<BaseEntity<MainProfileEntity>>> call(
      //ProfileRequestModel params,
      ) {
    return profileRepository.getProfile(//profileParams: params
        );
  }
}
