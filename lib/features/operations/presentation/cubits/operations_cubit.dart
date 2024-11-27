import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../data/models/request/operations_request_model.dart';
import '../../domain/entities/operations_entity.dart';
import '../../domain/use_cases/get_operations_usecase.dart';

part 'operations_state.dart';

@injectable
class OperationsCubit extends Cubit<OperationsState> {
  final GetOperationsUseCase getOperationsUseCase;
  OperationsCubit({required this.getOperationsUseCase})
      : super(OperationsInitialState());

  Future<void> getOperations(
      {required OperationsRequestModel operationsModel}) async {
    emit(OperationsLoadingState());

    final CustomResponseType<BaseEntity<OperationsEntity>>
        eitherSuccessOrFailure = await getOperationsUseCase(operationsModel);

    eitherSuccessOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(OperationsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<OperationsEntity> response) {
      emit(OperationsReadyState(response));
    });
  }
}
