


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/request/auth_request_model.dart';
import '../models/response/auth_response_model.dart';
import '../../../auth/data/data_sources/remote/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  AuthRepositoryImp({
    required this.authRemoteDataSource,
  });

  final AuthRemoteDataSource authRemoteDataSource;

  Future<CustomResponseType<BaseEntity<AuthModel>>> getAuth(
      {required AuthRequestModel authParams}) async {
    return await authRemoteDataSource.getAuth(
        authRequestModel: authParams);
  }
}


