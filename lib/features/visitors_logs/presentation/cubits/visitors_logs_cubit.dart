import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_visitors_logs_usecase.dart';
import '../../domain/entities/visitors_logs_entity.dart';
import '../../data/models/request/visitors_logs_request_model.dart';

part 'visitors_logs_state.dart';





@injectable
class VisitorsLogsCubit extends Cubit<VisitorsLogsState> {
  final GetVisitorsLogsUseCase getVisitorsLogsUseCase;
  VisitorsLogsCubit({required this.getVisitorsLogsUseCase}) : super(VisitorsLogsInitialState());

  Future<void> getVisitorsLogs(
      {required VisitorsLogsRequestModel visitorsLogsModel}) async {
    emit(VisitorsLogsLoadingState());

    final CustomResponseType<BaseEntity<VisitorsLogsEntity>> eitherPackagesOrFailure =
        await getVisitorsLogsUseCase(visitorsLogsModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(VisitorsLogsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<VisitorsLogsEntity> response) {
      emit(VisitorsLogsReadyState(response));
    });
  }
}















