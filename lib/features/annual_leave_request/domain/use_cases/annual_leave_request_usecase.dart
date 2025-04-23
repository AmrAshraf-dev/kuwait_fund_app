import 'package:injectable/injectable.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../../data/models/request/annual_leave_request_request_model.dart";
import "../repositories/annual_leave_request_repository.dart";

@injectable
class AnnualLeaveRequestUseCase
    implements UseCase< String , AnnualLeaveRequestRequestModel> {
  AnnualLeaveRequestUseCase({required this.annualLeaveRequestRepository});

  final AnnualLeaveRequestRepository annualLeaveRequestRepository;

  @override
  Future<CustomResponseType< String> > call(
    AnnualLeaveRequestRequestModel annualLeaveRequestModel,
  ) {
    return annualLeaveRequestRepository.createAnnualLeaveRequest(
        annualLeaveRequestRequestModel: annualLeaveRequestModel);
  }
}
