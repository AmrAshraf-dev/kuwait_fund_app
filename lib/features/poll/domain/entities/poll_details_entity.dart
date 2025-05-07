
import 'package:kf_ess_mobile_app/features/poll/data/models/response/answers_poll_model.dart';

class  PollDetailsEntity {

  final int? id;
  final String? question;
  final List<PollAnswersModel>? pollAnswers;

 const  PollDetailsEntity({
    this.id,
    this.question,
    required this.pollAnswers,
  });
}