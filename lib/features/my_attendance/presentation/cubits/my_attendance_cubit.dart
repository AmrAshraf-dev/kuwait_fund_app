import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/entities/my_attendance_entity.dart';
import '../../domain/use_cases/get_my_attendance_usecase.dart';

part 'my_attendance_state.dart';

@injectable
class MyAttendanceCubit extends Cubit<MyAttendanceState> {
  final GetMyAttendanceUseCase getMyAttendanceUseCase;
  MyAttendanceCubit({required this.getMyAttendanceUseCase})
      : super(MyAttendanceInitialState()) {
    getMyAttendance();
  }

  Future<void> getMyAttendance() async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(MyAttendanceLoadingState());

    final CustomResponseType<BaseEntity<MyAttendanceEntity>>
        eitherPackagesOrFailure = await getMyAttendanceUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(MyAttendanceErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<MyAttendanceEntity> response) {
      if (response.data == null) {
        emit(MyAttendanceErrorState(
          message: "No data found",
        ));
        return;
      }
      emit(MyAttendanceReadyState(response));
    });
  }
}
