import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/account_request_model.dart";
import "../entities/account_entity.dart";
import "../repositories/account_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetAccountUseCase implements UseCase<BaseEntity<AccountEntity>, AccountRequestModel> {
    GetAccountUseCase ({required this.accountRepository});

  final AccountRepository accountRepository;


  @override
  Future<CustomResponseType<BaseEntity<AccountEntity>>> call(
    AccountRequestModel params,
  ) {
    
    
    return accountRepository.getAccount(accountParams: params);
    
  }
}
