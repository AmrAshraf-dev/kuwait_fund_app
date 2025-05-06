import "package:kf_ess_mobile_app/features/poll/domain/entities/poll_details_entity.dart";

import "../../../../core/domain/usecase/base_usecase.dart";
 import "../repositories/poll_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetPollByIdUseCase implements UseCase<BaseEntity<PollDetailsEntity>, int> {
    GetPollByIdUseCase ({required this.pollRepository});

  final PollRepository pollRepository;


  @override
  Future<CustomResponseType<BaseEntity<PollDetailsEntity>>> call(
    int params,
  ) {


    return pollRepository.getPollById(pollParams: params);

  }
}
