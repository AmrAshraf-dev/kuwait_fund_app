import 'package:kf_ess_mobile_app/features/survey/domain/entities/survey_details_entity.dart';
import 'package:kf_ess_mobile_app/features/survey/domain/repositories/survey_repository.dart';

import "../../../../core/domain/usecase/base_usecase.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetSurveyByIdUseCase implements UseCase<BaseEntity<SurveyDetailsEntity>, int> {
    GetSurveyByIdUseCase ({required this.surveyRepository});

  final SurveyRepository surveyRepository;


  @override
  Future<CustomResponseType<BaseEntity<SurveyDetailsEntity>>> call(
    int params,
  ) {


    return surveyRepository.getSurveyById(pollParams: params);

  }
}
