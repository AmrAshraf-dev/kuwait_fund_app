import 'package:kf_ess_mobile_app/features/profile/data/models/request/child_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/child_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/child_entity.dart';
import "../../../../core/domain/usecase/base_usecase.dart";
import "../repositories/profile_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';

@injectable
class GetChildUseCase
    implements UseCase<BaseEntity<ChildModel>, ChildRequestModel> {
  GetChildUseCase({required this.childRepository});

  final ProfileRepository childRepository;

  @override
  Future<CustomResponseType<BaseEntity<ChildModel>>> call(
    ChildRequestModel params,
  ) {
    return childRepository.getChild(childParams: params);
  }
}
