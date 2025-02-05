import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../entities/family_member_entity.dart';
import '../repositories/insurance_repository.dart';

@injectable
class GetFamilyMembersUseCase {
  final InsuranceRepository repository;

  GetFamilyMembersUseCase(this.repository);

  Future<CustomResponseType<BaseEntity<List<FamilyMemberEntity>>>>
      call() async {
    return await repository.getFamilyMembers();
  }
}
