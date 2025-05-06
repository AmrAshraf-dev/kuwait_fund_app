part of 'survey_details_cubit.dart';


class SurveyDetailsErrorState extends SurveyDetailsState {
  final String? message;

  SurveyDetailsErrorState({this.message});
}

final class SurveyDetailsInitialState extends SurveyDetailsState {}

final class SurveyDetailsLoadingState extends SurveyDetailsState {}

final class SurveyDetailsReadyState extends SurveyDetailsState {
  SurveyDetailsReadyState(this.response);
    BaseEntity<SurveyDetailsEntity> response;

}

abstract class SurveyDetailsState {}
