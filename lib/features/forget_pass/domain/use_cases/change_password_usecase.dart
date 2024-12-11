import 'package:injectable/injectable.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../../data/models/request/forget_pass_request_model.dart";
import "../repositories/forget_pass_repository.dart";

@injectable
class ChangePasswordUseCase
    implements UseCase<BaseEntity<bool>, ForgetPassRequestModel> {
  ChangePasswordUseCase({required this.forgetPassRepository});

  final ForgetPassRepository forgetPassRepository;

  @override
  Future<CustomResponseType<BaseEntity<bool>>> call(
    ForgetPassRequestModel params,
  ) {
    return forgetPassRepository.changePassword(forgetPassParams: params);
  }
}
