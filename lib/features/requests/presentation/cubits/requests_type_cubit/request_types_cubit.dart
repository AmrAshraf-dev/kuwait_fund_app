// TabCubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import '../../../domain/entities/request_type_entity.dart';
import '../../../domain/use_cases/get_request_types_usecase.dart';

part 'request_types_state.dart';

@injectable
class RequestTypesCubit extends Cubit<RequestTypesState> {
  RequestTypesCubit(this._getRequestTypesUseCase)
      : super(RequestTypesInitial()) {
    fetchRequestTypes();
  }

  final GetRequestTypesUseCase _getRequestTypesUseCase;

  //void changeTab(int index) => emit(RequestTypesChanged(index));

  Future<void> fetchRequestTypes() async {
    emit(RequestTypesLoading());
    final result = await _getRequestTypesUseCase();
    result.fold(
      (failure) => emit(RequestTypesError(
          message: FailureToMassage().mapFailureToMessage(failure))),
      (requestTypes) =>
          emit(RequestTypesLoaded(requestTypes: requestTypes.data!)),
    );
  }
}
