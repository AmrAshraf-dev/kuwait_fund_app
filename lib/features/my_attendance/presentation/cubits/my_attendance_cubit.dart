import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_my_attendance_usecase.dart';
import '../../domain/entities/my_attendance_entity.dart';
import '../../data/models/request/my_attendance_request_model.dart';

part 'my_attendance_state.dart';





@injectable
class MyAttendanceCubit extends Cubit<MyAttendanceState> {
  final GetMyAttendanceUseCase getMyAttendanceUseCase;
  MyAttendanceCubit({required this.getMyAttendanceUseCase}) : super(MyAttendanceInitialState());

  Future<void> getMyAttendance(
      {required MyAttendanceRequestModel myAttendanceModel}) async {
    emit(MyAttendanceLoadingState());

    final CustomResponseType<BaseEntity<MyAttendanceEntity>> eitherPackagesOrFailure =
        await getMyAttendanceUseCase(myAttendanceModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(MyAttendanceErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<MyAttendanceEntity> response) {
      emit(MyAttendanceReadyState(response));
    });
  }
}















