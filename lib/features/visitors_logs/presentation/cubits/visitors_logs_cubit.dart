import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/response/visitors_management_calendar_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/use_cases/get_can_view_visitors_logs_usecase.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/use_cases/get_visitor_logs_hosts_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_visitors_logs_usecase.dart';
import '../../data/models/request/visitors_logs_request_model.dart';

part 'visitors_logs_state.dart';

@injectable
class VisitorsLogsCubit extends Cubit<VisitorsLogsState> {
  final GetVisitorLogsHostsUseCase getVisitorLogsHostsUseCase;
  final GetVisitorLogsUseCase  getVisitorLogsUseCase;

  final GetCanViewVisitorsLogsUsecase getCanViewVisitorsLogsUseCase;
  VisitorsLogsCubit(this.getVisitorLogsHostsUseCase,
  this.getCanViewVisitorsLogsUseCase,
     this.getVisitorLogsUseCase)
      : super(VisitorsLogsInitialState());

  Future<void> getVisitorsLogs(
      {required VisitorsLogsRequestModel visitorsLogsModel}) async {
    emit(VisitorsLogsLoadingState());

    final CustomResponseType<BaseEntity<List<VisitorsLogsEntity>>>
        eitherPackagesOrFailure =
        await getVisitorLogsUseCase(visitorsLogsModel);

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
      String currentDate) async {
    emit(VisitorsLogsLoadingState());

    final CustomResponseType<BaseEntity<List<VisitorsLogsHostsEntity>>>
        eitherPackagesOrFailure =
        await getVisitorLogsHostsUseCase(currentDate);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(VisitorsLogsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<VisitorsLogsHostsEntity>> response) {
      emit(VisitorsLogsHostsReadyState(response));
    });
  }

  getCanViewVisitorsLogs() async {
        emit(VisitorsLogsLoadingState());

    final CustomResponseType<bool>
        eitherPackagesOrFailure =
        await getCanViewVisitorsLogsUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(VisitorsLogsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (bool canView) {
      if(canView){
        emit(VisitorsLogsCanViewState());
        
      }else{
        emit(VisitorsLogsCanNotViewState());
      }
      
    });
  }

  getVisitorLogsDetails(visitorLogsDetailsRequestModel) {}

 
}
