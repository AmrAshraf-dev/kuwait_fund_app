import 'package:injectable/injectable.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../entities/look_up_entity.dart';
import "../repositories/profile_repository.dart";

@injectable
class GetLookupUsecase implements UseCase<BaseEntity<List<LookUpEntity>>, String> //ProfileRequestModel
{
  GetLookupUsecase({required this.profileRepository});

  final ProfileRepository profileRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<LookUpEntity>>>> call( String lookupPath,
       ) {
    return profileRepository.getLookup( 
      lookupPath,   );
  }
}
