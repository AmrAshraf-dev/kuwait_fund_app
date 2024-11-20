part of 'survey_cubit.dart';

class SurveyErrorState extends SurveyState {
  final String? message;

  SurveyErrorState({this.message});
}

final class SurveyInitialState extends SurveyState {}

final class SurveyLoadingState extends SurveyState {}

final class SurveyReadyState extends SurveyState {
  SurveyReadyState(this.response);
    BaseEntity<SurveyEntity> response;

}

abstract class SurveyState {}
