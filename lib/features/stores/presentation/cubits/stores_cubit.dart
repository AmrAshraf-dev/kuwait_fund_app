import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_stores_usecase.dart';
import '../../domain/entities/stores_entity.dart';
import '../../data/models/request/stores_request_model.dart';

part 'stores_state.dart';





@injectable
class StoresCubit extends Cubit<StoresState> {
  final GetStoresUseCase getStoresUseCase;
  StoresCubit({required this.getStoresUseCase}) : super(StoresInitialState());

  Future<void> getStores(
      {required StoresRequestModel storesModel}) async {
    emit(StoresLoadingState());

    final CustomResponseType<BaseEntity<StoresEntity>> eitherPackagesOrFailure =
        await getStoresUseCase(storesModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(StoresErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<StoresEntity> response) {
      emit(StoresReadyState(response));
    });
  }
}















