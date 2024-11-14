import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/home_request_model.dart';
import '../../models/response/home_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<CustomResponseType<HomeResponseModel>> getHome(
      {required HomeRequestModel homeRequestModel});
}

@Injectable(as: HomeRemoteDataSource)
class HomeDataSourceImpl implements HomeRemoteDataSource {
  HomeDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<HomeResponseModel>> getHome(
      {required HomeRequestModel homeRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": homeRequestModel.email ?? "",
      "lang": homeRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(HomeResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
