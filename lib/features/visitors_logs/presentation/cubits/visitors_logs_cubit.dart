import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/response/visitors_management_calendar_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_details_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/use_cases/get_can_view_visitors_logs_usecase.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/use_cases/get_visitor_logs_hosts_usecase.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/use_cases/get_visitors_logs__details_usecase.dart';

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

  final GetVisitorsLogsDetailsUseCase getVisitorLogsDetailsUseCase;

  final GetCanViewVisitorsLogsUsecase getCanViewVisitorsLogsUseCase;
  VisitorsLogsCubit(this.getVisitorLogsHostsUseCase,
  this.getVisitorLogsDetailsUseCase,
  this.getCanViewVisitorsLogsUseCase,
     this.getVisitorLogsUseCase)
      : super(VisitorsLogsInitialState());

  Future<void> getVisitorsLogs(
      {required VisitorsLogsRequestModel visitorsLogsModel}) async {
    await Future.delayed(const Duration(milliseconds: 100));
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
      String calendarPressedDate,  {required showNewBottomSheet} ) async {
    emit(VisitorsLogsLoadingState());

    final CustomResponseType<BaseEntity<List<VisitorsLogsHostsEntity>>>
        eitherPackagesOrFailure =
        await getVisitorLogsHostsUseCase(calendarPressedDate);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(VisitorsLogsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<VisitorsLogsHostsEntity>> response) async {
      if( response.data?.isEmpty == true|| response.data == null){
        emit(VisitorsLogsErrorState(
          message: "no_visitors_logs",
        ));
      }else{
      emit(VisitorsLogsHostsReadyState(response,showNewBottomSheet  ));
      }
    });
  }

 getVisitorLogsDetails(visitorLogsDetailsRequestModel,{required bool showNewBottomSheet}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(VisitorsLogsLoadingState());

    final CustomResponseType<BaseEntity<List<VisitorsLogsDetailsEntity>>>
        eitherPackagesOrFailure =
        await getVisitorLogsDetailsUseCase(visitorLogsDetailsRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(VisitorsLogsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<VisitorsLogsDetailsEntity>> response) {
      emit(VisitorsLogsDetailsReadyState(response,  showNewBottomSheet));
    });
  }

  getCanViewVisitorsLogs() async {
    await Future.delayed(const Duration(milliseconds: 100));
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
      ViewsToolbox.dismissLoading();
      if(canView){
        emit(VisitorsLogsCanViewState());
        
      }else{
        emit(VisitorsLogsCanNotViewState());
      }
      
    });
  }

 

 
}
