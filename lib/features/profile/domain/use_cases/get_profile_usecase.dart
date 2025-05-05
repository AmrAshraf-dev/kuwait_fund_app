import 'package:injectable/injectable.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../entities/main_profile_entity.dart';
import "../repositories/profile_repository.dart";

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
