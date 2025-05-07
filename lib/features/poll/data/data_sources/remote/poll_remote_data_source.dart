import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/poll/data/models/request/survey_poll_answer_request_model.dart';
import 'package:kf_ess_mobile_app/features/poll/data/models/response/poll_details_response_model.dart';
import 'package:kf_ess_mobile_app/features/poll/data/models/response/survey_poll_answer_response_model.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/poll_request_model.dart';
import '../../models/response/poll_response_model.dart';

abstract class PollRemoteDataSource {
  Future<CustomResponseType<PollResponseModel>> getPoll(
      {required PollRequestModel pollRequestModel});

  Future<CustomResponseType<PollDetailsResponseModel>> getPollById(
      {required int pollParams});

  Future<CustomResponseType<SurveyPollAnswerResponseModel>>
      submitSurveyPollAnswer(
          {required SurveyPollAnswerRequestModel surveyPollAnswerRequestModel});
}

@Injectable(as: PollRemoteDataSource)
class PollDataSourceImpl implements PollRemoteDataSource {
  PollDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<PollResponseModel>> getPoll(
      {required PollRequestModel pollRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.allPolls, data: <String, int>{
      "pageNumber": pollRequestModel.pageNumber,
      "pageSize": pollRequestModel.pageSize ?? 10,
    });

    if (result.success) {
      return right(PollResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<PollDetailsResponseModel>> getPollById(
      {required int pollParams}) async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.pollById, queryParams: {
      "pollId": pollParams,
    });

    if (result.success) {
      return right(PollDetailsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<SurveyPollAnswerResponseModel>>
      submitSurveyPollAnswer(
          {required SurveyPollAnswerRequestModel
              surveyPollAnswerRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.submitSurveyPollAnswer, data: {
      [
        {
          "questionId": surveyPollAnswerRequestModel.questionId,
          "answerId": surveyPollAnswerRequestModel.answerId,
        }
      ],
    });

    if (result.success) {
      return right(SurveyPollAnswerResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
