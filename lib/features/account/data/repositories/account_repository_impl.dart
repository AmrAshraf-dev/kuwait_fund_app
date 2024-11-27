


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/account_repository.dart';
import '../models/request/account_request_model.dart';
import '../models/response/account_response_model.dart';
import '../../../account/data/data_sources/remote/account_remote_data_source.dart';

@Injectable(as: AccountRepository)
class AccountRepositoryImp implements AccountRepository {
  AccountRepositoryImp({
    required this.accountRemoteDataSource,
  });

  final AccountRemoteDataSource accountRemoteDataSource;

  Future<CustomResponseType<BaseEntity<AccountModel>>> getAccount(
      {required AccountRequestModel accountParams}) async {
    return await accountRemoteDataSource.getAccount(
        accountRequestModel: accountParams);
  }
}


