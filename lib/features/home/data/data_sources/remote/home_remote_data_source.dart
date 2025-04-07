import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
 import '../../models/response/home_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<CustomResponseType<HomeResponseModel>> getHome(
    );
}

@Injectable(as: HomeRemoteDataSource)
class HomeDataSourceImpl implements HomeRemoteDataSource {
  HomeDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<HomeResponseModel>> getHome(
     ) async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.getLeaveDashboard);

    if (result.success) {
   
      return right(HomeResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
