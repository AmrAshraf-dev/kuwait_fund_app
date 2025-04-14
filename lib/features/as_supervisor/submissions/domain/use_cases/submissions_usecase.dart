import 'package:injectable/injectable.dart';
import "package:kf_ess_mobile_app/features/as_supervisor/submissions/domain/entities/submission_entity.dart";

import "../../../../../core/domain/usecase/base_usecase.dart";
import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import "../repositories/submissions_repository.dart";

@injectable
class GetSubmissionUseCase
    implements UseCaseNoParam<BaseEntity<List<SubmissionEntity>>> {
  GetSubmissionUseCase({required this.submissionsRepository});

  final SubmissionsRepository submissionsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<SubmissionEntity>>>> call() {
    return submissionsRepository.getSubmission();
  }
}
