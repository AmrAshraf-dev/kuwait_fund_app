import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/auth_request_model.dart";
import "../entities/auth_entity.dart";
import "../repositories/auth_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetAuthUseCase implements UseCase<BaseEntity<AuthEntity>, AuthRequestModel> {
    GetAuthUseCase ({required this.authRepository});

  final AuthRepository authRepository;


  @override
  Future<CustomResponseType<BaseEntity<AuthEntity>>> call(
    AuthRequestModel params,
  ) {
    
    
    return authRepository.getAuth(authParams: params);
    
  }
}
