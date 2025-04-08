import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/request/visitor_logs_hosts_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/response/visitors_management_calendar_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/use_cases/get_visitor_logs_hosts_usecase.dart';

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
  final GetVisitorLogsHostsUseCase getVisitorLogsHostsUseCase;
  final VisitorsManagementCalendarUseCase visitorsManagementCalendarUseCase;
  VisitorsLogsCubit(this.getVisitorLogsHostsUseCase,
      this.getVisitorsLogsUseCase, this.visitorsManagementCalendarUseCase)
      : super(VisitorsLogsInitialState());

  Future<void> getVisitorsLogs(
      {required VisitorsLogsRequestModel visitorsLogsModel}) async {
    emit(VisitorsLogsLoadingState());

    final CustomResponseType<BaseEntity<List<VisitorsLogsEntity>>>
        eitherPackagesOrFailure =
        await getVisitorsLogsUseCase(visitorsLogsModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(VisitorsLogsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<VisitorsLogsEntity>> response) {
      emit(VisitorsLogsReadyState(response));
    });
  }
  //

  Future<void> getHostsList(
      {List<VisitorLogsHostsModel>? visitorsLogsHostsModel}) async {
    emit(VisitorsLogsLoadingState());

    final CustomResponseType<BaseEntity<List<VisitorLogsHostsEntity>>>
        eitherPackagesOrFailure =
        await getVisitorLogsHostsUseCase(visitorsLogsHostsModel ?? []);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(VisitorsLogsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<VisitorLogsHostsEntity>> response) {
      emit(VisitorsLogsHostsReadyState(response));
    });
  }

  Future<void> getVisitorsManagementCalendarList(
      {List<VisitorsManagementCalendarModel>?
          visitorManagementCalendarModel}) async {
    emit(VisitorsLogsLoadingState());

    final CustomResponseType<List<VisitorsManagementCalendarEntity>>
        eitherPackagesOrFailure = await visitorsManagementCalendarUseCase(
            visitorManagementCalendarModel ?? []);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(VisitorsLogsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (List<VisitorsManagementCalendarEntity> response) {
      emit(VisitorsManagementCalendarReadyState(response));
    });
  }
}
