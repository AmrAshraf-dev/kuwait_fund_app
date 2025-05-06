import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/survey_request_model.dart";
import "../entities/survey_entity.dart";
import "../repositories/survey_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetSurveyUseCase implements UseCase<BaseEntity<List<SurveyEntity>>, SurveyRequestModel> {
    GetSurveyUseCase ({required this.surveyRepository});

  final SurveyRepository surveyRepository;


  @override
  Future<CustomResponseType<BaseEntity<List<SurveyEntity>>>> call(
    SurveyRequestModel params,
  ) {


    return surveyRepository.getSurvey(surveyParams: params);

  }
}
