


import 'package:kf_ess_mobile_app/features/survey/data/models/response/poll_questions_model.dart';

class  SurveyDetailsEntity {


  final int? id;
  final String? title;
  final List<PollQuestionsModel>? pollQuestions;

 const  SurveyDetailsEntity({
    this.id,
    this.title,
    required this.pollQuestions,
  });
}