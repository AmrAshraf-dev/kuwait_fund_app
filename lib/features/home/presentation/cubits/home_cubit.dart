import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/home/domain/use_cases/get_leave_dashboard_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_home_usecase.dart';
import '../../domain/entities/home_entity.dart';
import '../../data/models/request/home_request_model.dart';

part 'home_state.dart';





@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetHomeUseCase getHomeUseCase;
  final GetLeaveDashboardUseCase  getLeaveDashboardUseCase;
  HomeCubit({required this.getHomeUseCase,
  required this.getLeaveDashboardUseCase}) : super(HomeInitialState());




  Future<void> getLeaveDashboard(
      ) async {

        await Future.
        delayed(const Duration(seconds: 1));
    emit(HomeLoadingState());

    final CustomResponseType<BaseEntity<HomeEntity>> eitherPackagesOrFailure =
        await getLeaveDashboardUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(HomeErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<HomeEntity> response) {
      ViewsToolbox.dismissLoading();
      emit(HomeReadyState(response));
    });
  }

  Future<void> getHome(
      {required HomeRequestModel homeModel}) async {
    emit(HomeLoadingState());

    final CustomResponseType<BaseEntity<HomeEntity>> eitherPackagesOrFailure =
        await getHomeUseCase( );

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(HomeErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<HomeEntity> response) {
      emit(HomeReadyState(response));
    });
  }
}















