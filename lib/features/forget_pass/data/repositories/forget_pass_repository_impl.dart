import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../forget_pass/data/data_sources/remote/forget_pass_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/forget_pass_repository.dart';
import '../models/request/forget_pass_request_model.dart';

@Injectable(as: ForgetPassRepository)
class ForgetPassRepositoryImp implements ForgetPassRepository {
  ForgetPassRepositoryImp({
    required this.forgetPassRemoteDataSource,
  });

  final ForgetPassRemoteDataSource forgetPassRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<bool>>> getForgetPass(
      {required ForgetPassRequestModel forgetPassParams}) async {
    return await forgetPassRemoteDataSource.getForgetPass(
        forgetPassRequestModel: forgetPassParams);
  }

  @override
  Future<CustomResponseType<BaseEntity<bool>>> verifyOtp(
      {required ForgetPassRequestModel forgetPassParams}) async {
    return await forgetPassRemoteDataSource.verifyOtp(
        forgetPassRequestModel: forgetPassParams);
  }

  @override
  Future<CustomResponseType<BaseEntity<bool>>> changePassword(
      {required ForgetPassRequestModel forgetPassParams}) async {
    return await forgetPassRemoteDataSource.changePassword(
        forgetPassRequestModel: forgetPassParams);
  }
}
