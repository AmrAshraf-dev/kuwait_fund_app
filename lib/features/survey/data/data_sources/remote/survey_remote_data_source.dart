import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/survey/data/models/response/survey_details_response_model.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/survey_request_model.dart';
import '../../models/response/survey_response_model.dart';

abstract class SurveyRemoteDataSource {
  Future<CustomResponseType<SurveyResponseModel>> getSurvey(
      {required SurveyRequestModel surveyRequestModel});

   Future<CustomResponseType<SurveyDetailsResponseModel>>  getSurveyById({required int pollParams}) ;
}

@Injectable(as: SurveyRemoteDataSource)
class SurveyDataSourceImpl implements SurveyRemoteDataSource {
  SurveyDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<SurveyResponseModel>> getSurvey(
      {required SurveyRequestModel surveyRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.allSurveys,  data: <String, int>{
     "pageNumber": surveyRequestModel.pageNumber,
      "pageSize": surveyRequestModel.pageSize??10,
    });

    if (result.success) {

      return right(SurveyResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<SurveyDetailsResponseModel>> getSurveyById({required int pollParams}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.surveyById,queryParams:
         {
      "surveyId": pollParams,
         });

    if (result.success) {
      return right(SurveyDetailsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
