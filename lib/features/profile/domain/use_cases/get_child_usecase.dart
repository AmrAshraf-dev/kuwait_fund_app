import '../../data/models/request/child_request_model.dart';
 import '../entities/child_entity.dart';
import "../../../../core/domain/usecase/base_usecase.dart";
import "../repositories/profile_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';

@injectable
class GetChildUseCase
    implements UseCase<BaseEntity<ChildEntity>, ChildRequestModel> {
  GetChildUseCase({required this.childRepository});

  final ProfileRepository childRepository;

  @override
  Future<CustomResponseType<BaseEntity<ChildEntity>>> call(
    ChildRequestModel params,
  ) {
    return childRepository.getChild(childParams: params);
  }
}
