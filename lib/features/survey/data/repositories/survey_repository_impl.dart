


import 'package:injectable/injectable.dart';
 import 'package:kf_ess_mobile_app/features/survey/data/models/response/survey_details_response_model.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/survey_repository.dart';
import '../models/request/survey_request_model.dart';
import '../models/response/survey_response_model.dart';
import '../../../survey/data/data_sources/remote/survey_remote_data_source.dart';

@Injectable(as: SurveyRepository)
class SurveyRepositoryImp implements SurveyRepository {
  SurveyRepositoryImp({
    required this.surveyRemoteDataSource,
  });

  final SurveyRemoteDataSource surveyRemoteDataSource;


@override
  Future<CustomResponseType<BaseEntity<List<SurveyModel>>>> getSurvey(
      {required SurveyRequestModel surveyParams}) async {
    return await surveyRemoteDataSource.getSurvey(
        surveyRequestModel: surveyParams);
  }

  @override
  Future<CustomResponseType<BaseEntity<SurveyDetailsModel>>> getSurveyById({required int pollParams}) async {
    return await surveyRemoteDataSource.getSurveyById(pollParams: pollParams);
  }
}


