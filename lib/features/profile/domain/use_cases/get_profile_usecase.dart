import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/profile_request_model.dart";
import "../entities/profile_entity.dart";
import "../repositories/profile_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetProfileUseCase implements UseCase<BaseEntity<ProfileEntity>, ProfileRequestModel> {
    GetProfileUseCase ({required this.profileRepository});

  final ProfileRepository profileRepository;


  @override
  Future<CustomResponseType<BaseEntity<ProfileEntity>>> call(
    ProfileRequestModel params,
  ) {
    
    
    return profileRepository.getProfile(profileParams: params);
    
  }
}
