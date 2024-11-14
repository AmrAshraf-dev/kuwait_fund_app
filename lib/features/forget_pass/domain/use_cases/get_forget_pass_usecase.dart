import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/forget_pass_request_model.dart";
import "../entities/forget_pass_entity.dart";
import "../repositories/forget_pass_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetForgetPassUseCase implements UseCase<BaseEntity<ForgetPassEntity>, ForgetPassRequestModel> {
    GetForgetPassUseCase ({required this.forgetPassRepository});

  final ForgetPassRepository forgetPassRepository;


  @override
  Future<CustomResponseType<BaseEntity<ForgetPassEntity>>> call(
    ForgetPassRequestModel params,
  ) {
    
    
    return forgetPassRepository.getForgetPass(forgetPassParams: params);
    
  }
}
