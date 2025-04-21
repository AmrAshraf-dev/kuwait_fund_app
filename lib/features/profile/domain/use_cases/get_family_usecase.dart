import 'package:kf_ess_mobile_app/features/profile/domain/entities/family_entity.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/repositories/profile_repository.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';

@injectable
class GetFamilyUseCase
    implements UseCaseNoParam<BaseEntity<List<FamilyEntity>>> {
  GetFamilyUseCase({required this.addFamilyRepository});

  final ProfileRepository addFamilyRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<FamilyEntity>>>> call() {
    return addFamilyRepository.getFamily();
  }
}
