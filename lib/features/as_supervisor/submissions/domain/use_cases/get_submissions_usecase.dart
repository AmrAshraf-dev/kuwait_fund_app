import 'package:injectable/injectable.dart';

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import "../../data/models/request/submissions_request_model.dart";
import "../entities/submissions_entity.dart";
import "../repositories/submissions_repository.dart";

@injectable
class GetSubmissionsUseCase
    implements UseCase<BaseEntity<SubmissionsEntity>, SubmissionsRequestModel> {
  GetSubmissionsUseCase({required this.submissionsRepository});

  final SubmissionsRepository submissionsRepository;

  @override
  Future<CustomResponseType<BaseEntity<SubmissionsEntity>>> call(
    SubmissionsRequestModel params,
  ) {
    return submissionsRepository.getSubmissions(submissionsParams: params);
  }
}
