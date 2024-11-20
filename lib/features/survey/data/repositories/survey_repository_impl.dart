


import 'package:injectable/injectable.dart';

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

  Future<CustomResponseType<BaseEntity<SurveyModel>>> getSurvey(
      {required SurveyRequestModel surveyParams}) async {
    return await surveyRemoteDataSource.getSurvey(
        surveyRequestModel: surveyParams);
  }
}


