import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/profile_request_model.dart';
import '../../models/response/profile_response_model.dart';

abstract class ProfileRemoteDataSource {
  Future<CustomResponseType<ProfileResponseModel>> getProfile(
      {required ProfileRequestModel profileRequestModel});
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileDataSourceImpl implements ProfileRemoteDataSource {
  ProfileDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<ProfileResponseModel>> getProfile(
      {required ProfileRequestModel profileRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": profileRequestModel.email ?? "",
      "lang": profileRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(ProfileResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
