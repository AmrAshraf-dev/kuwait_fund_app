import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_offers_usecase.dart';
import '../../domain/entities/offers_entity.dart';
import '../../data/models/request/offers_request_model.dart';

part 'offers_state.dart';





@injectable
class OffersCubit extends Cubit<OffersState> {
  final GetOffersUseCase getOffersUseCase;
  OffersCubit({required this.getOffersUseCase}) : super(OffersInitialState());

  Future<void> getOffers(
      {required OffersRequestModel offersModel}) async {
    emit(OffersLoadingState());

    final CustomResponseType<BaseEntity<OffersEntity>> eitherPackagesOrFailure =
        await getOffersUseCase(offersModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(OffersErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<OffersEntity> response) {
      emit(OffersReadyState(response));
    });
  }
}















