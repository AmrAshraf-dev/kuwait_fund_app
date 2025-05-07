part of 'survey_poll_answer_cubit.dart';

class SurveyPollAnswerErrorState extends SurveyPollAnswerState {
  final String? message;

  SurveyPollAnswerErrorState({this.message});
}

final class SurveyPollAnswerInitialState extends SurveyPollAnswerState {}

final class SurveyPollAnswerLoadingState extends SurveyPollAnswerState {}

final class SurveyPollAnswerReadyState extends SurveyPollAnswerState {
  SurveyPollAnswerReadyState(this.response);
  BaseEntity<String> response;
}

abstract class SurveyPollAnswerState {}
