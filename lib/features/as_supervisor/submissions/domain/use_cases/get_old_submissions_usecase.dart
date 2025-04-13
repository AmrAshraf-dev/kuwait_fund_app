import 'package:injectable/injectable.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import "../../data/models/request/submissions_request_model.dart";
import "../entities/old_submissions_entity.dart";
import "../repositories/submissions_repository.dart";

@injectable
class GetOldSubmissionsUseCase
    implements
        UseCase<BaseEntity<List<OldSubmissionsEntity>>,
            SubmissionsRequestModel> {
  GetOldSubmissionsUseCase({required this.submissionsRepository});

  final SubmissionsRepository submissionsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<OldSubmissionsEntity>>>> call(
    SubmissionsRequestModel params,
  ) {
    return submissionsRepository.getOldSubmissions(
        oldSubmissionsParams: params);
  }
}
