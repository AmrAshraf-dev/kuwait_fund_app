import '../entities/address_entity.dart';
import '../repositories/profile_repository.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';

@injectable
class GetAddressUseCase implements UseCaseNoParam<BaseEntity<MyAddressEntity>> {
  GetAddressUseCase({required this.addressRepository});

  final ProfileRepository addressRepository;

  @override
  Future<CustomResponseType<BaseEntity<MyAddressEntity>>> call() {
    return addressRepository.getAddress();
  }
}
