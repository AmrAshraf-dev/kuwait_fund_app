import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/poll_request_model.dart";
import "../entities/poll_entity.dart";
import "../repositories/poll_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetPollUseCase implements UseCase<BaseEntity<List<PollEntity>>, PollRequestModel> {
    GetPollUseCase ({required this.pollRepository});

  final PollRepository pollRepository;


  @override
  Future<CustomResponseType<BaseEntity<List<PollEntity>>>> call(
    PollRequestModel params,
  ) {


    return pollRepository.getPoll(pollParams: params);

  }
}
