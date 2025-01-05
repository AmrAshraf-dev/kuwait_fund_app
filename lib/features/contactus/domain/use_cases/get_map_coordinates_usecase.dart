import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/contactus/domain/entities/contactus_entity.dart';
import 'package:kf_ess_mobile_app/features/contactus/domain/repositories/contactus_repository.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';

@injectable
class GetCoordinatesUseCase
    implements UseCaseNoParam<BaseEntity<ContactusEntity>> {
  GetCoordinatesUseCase({required this.contactusRepository});

  final ContactusRepository contactusRepository;

  @override
  Future<CustomResponseType<BaseEntity<ContactusEntity>>> call() {
    return contactusRepository.getMapCoordinates();
  }
}
