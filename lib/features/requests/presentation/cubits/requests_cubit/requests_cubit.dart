import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";
import '../../../data/models/request/requests_request_model.dart';
import '../../../domain/entities/requests_entity.dart';
import '../../../domain/use_cases/get_requests_usecase.dart';

part 'requests_state.dart';

@injectable
class RequestsCubit extends Cubit<RequestsState> {
  final GetRequestsUseCase getRequestsUseCase;
  RequestsCubit({required this.getRequestsUseCase})
      : super(RequestsInitialState()) {
    getRequests(requestsModel: RequestsRequestModel());
  }

  Future<void> getRequests(
      {required RequestsRequestModel requestsModel}) async {
    emit(RequestsLoadingState());

    final CustomResponseType<BaseEntity<List<RequestsEntity>>>
        eitherPackagesOrFailure = await getRequestsUseCase(requestsModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(RequestsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<RequestsEntity>> response) {
      if (response.data?.isEmpty ?? true) {
        emit(RequestsEmptyState());
        return;
      } else {
        emit(RequestsReadyState(response));
      }
    });
  }
}
