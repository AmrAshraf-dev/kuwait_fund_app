
 import 'package:kf_ess_mobile_app/features/survey/data/models/response/answers_poll_model.dart';

class PollQuestionsEntity {
  int? id ;
  String? question;
  List<PollAnswersModel>? pollAnswers;

  PollQuestionsEntity({
    this.id,
    this.question,
    required this.pollAnswers,
  });
}