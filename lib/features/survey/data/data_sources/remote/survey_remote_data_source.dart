import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/survey_request_model.dart';
import '../../models/response/survey_response_model.dart';

abstract class SurveyRemoteDataSource {
  Future<CustomResponseType<SurveyResponseModel>> getSurvey(
      {required SurveyRequestModel surveyRequestModel});
}

@Injectable(as: SurveyRemoteDataSource)
class SurveyDataSourceImpl implements SurveyRemoteDataSource {
  SurveyDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<SurveyResponseModel>> getSurvey(
      {required SurveyRequestModel surveyRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": surveyRequestModel.email ?? "",
      "lang": surveyRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(SurveyResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
