


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/forget_pass_repository.dart';
import '../models/request/forget_pass_request_model.dart';
import '../models/response/forget_pass_response_model.dart';
import '../../../forget_pass/data/data_sources/remote/forget_pass_remote_data_source.dart';

@Injectable(as: ForgetPassRepository)
class ForgetPassRepositoryImp implements ForgetPassRepository {
  ForgetPassRepositoryImp({
    required this.forgetPassRemoteDataSource,
  });

  final ForgetPassRemoteDataSource forgetPassRemoteDataSource;

  Future<CustomResponseType<BaseEntity<ForgetPassModel>>> getForgetPass(
      {required ForgetPassRequestModel forgetPassParams}) async {
    return await forgetPassRemoteDataSource.getForgetPass(
        forgetPassRequestModel: forgetPassParams);
  }
}


