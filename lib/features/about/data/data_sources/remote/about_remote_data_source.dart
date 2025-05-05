import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../models/response/kf_board_of_directors_response_model.dart';
import '../../models/response/kf_managment_response_model.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/response/general_information_response_model.dart';

abstract class AboutRemoteDataSource {
  Future<CustomResponseType<GeneralInformationResponseModel>> getAbout();

  Future<CustomResponseType<KFManagmentResponseModel>> getKFManagment();

  Future<CustomResponseType<KFBoardOfDirectorsResponseModel>>
      getKFBoardOfDirectors();
}

@Injectable(as: AboutRemoteDataSource)
class AboutDataSourceImpl implements AboutRemoteDataSource {
  AboutDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<GeneralInformationResponseModel>> getAbout() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getGeneralInformation,
    );

    if (result.success) {
      return right(GeneralInformationResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<KFManagmentResponseModel>> getKFManagment() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getKFManagment,
    );

    if (result.success) {
      return right(KFManagmentResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<KFBoardOfDirectorsResponseModel>>
      getKFBoardOfDirectors() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getKFBoardOfDirectors,
    );

    if (result.success) {
      return right(KFBoardOfDirectorsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
