import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/shared/data/local_data.dart';

import '../../../../core/network/base_handling.dart';
import '../../../auth/data/data_sources/remote/auth_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/request/auth_request_model.dart';
import '../models/response/auth_response_model.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  AuthRepositoryImp({
    required this.authRemoteDataSource,
  });

  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<AuthModel>>> getAuth(
      {required AuthRequestModel authParams}) async {
    var result =
        await authRemoteDataSource.getAuth(authRequestModel: authParams);
    result.fold(
      (failure) {
        Left(failure);
      },
      (response) {
        if (response.code == 200) LocalData().saveUser(response.data);
        return Right(response);
      },
    );

    return await authRemoteDataSource.getAuth(authRequestModel: authParams);
  }
}
