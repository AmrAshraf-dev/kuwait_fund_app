import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

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
  HomeCubit({required this.getHomeUseCase}) : super(HomeInitialState());

  Future<void> getHome(
      {required HomeRequestModel homeModel}) async {
    emit(HomeLoadingState());

    final CustomResponseType<BaseEntity<HomeEntity>> eitherPackagesOrFailure =
        await getHomeUseCase(homeModel);

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















