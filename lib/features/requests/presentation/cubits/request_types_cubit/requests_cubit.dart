import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";
import '../../../domain/entities/requests_entity.dart';
import '../../../domain/use_cases/get_requests_usecase.dart';

part 'requests_state.dart';

@injectable
class RequestsCubit extends Cubit<RequestsState> {
  final GetRequestsUseCase getRequestsUseCase;
  RequestsCubit({required this.getRequestsUseCase})
      : super(RequestsInitialState()) ;

  Future<void> getRequests(
     ) async {
    emit(RequestsLoadingState());

    final CustomResponseType<BaseEntity<List<RequestsEntity>>>
        eitherPackagesOrFailure = await getRequestsUseCase();

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
