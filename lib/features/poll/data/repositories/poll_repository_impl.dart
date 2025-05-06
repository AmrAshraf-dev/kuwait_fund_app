


import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/poll/data/models/response/poll_details_response_model.dart';
import 'package:kf_ess_mobile_app/features/poll/domain/entities/poll_details_entity.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/poll_repository.dart';
import '../models/request/poll_request_model.dart';
import '../models/response/poll_response_model.dart';
import '../../../poll/data/data_sources/remote/poll_remote_data_source.dart';

@Injectable(as: PollRepository)
class PollRepositoryImp implements PollRepository {
  PollRepositoryImp({
    required this.pollRemoteDataSource,
  });

  final PollRemoteDataSource pollRemoteDataSource;


@override
  Future<CustomResponseType<BaseEntity<List<PollModel>>>> getPoll(
      {required PollRequestModel pollParams}) async {
    return await pollRemoteDataSource.getPoll(
        pollRequestModel: pollParams);
  }

  @override
  Future<CustomResponseType<BaseEntity<PollDetailsModel>>> getPollById({required int pollParams}) async {
    return await pollRemoteDataSource.getPollById(pollParams: pollParams);
  }
}


