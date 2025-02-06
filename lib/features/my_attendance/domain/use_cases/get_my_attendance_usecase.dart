import 'package:injectable/injectable.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../entities/my_attendance_entity.dart";
import "../repositories/my_attendance_repository.dart";

@injectable
class GetMyAttendanceUseCase
    implements UseCaseNoParam<BaseEntity<MyAttendanceEntity>> {
  GetMyAttendanceUseCase({required this.myAttendanceRepository});

  final MyAttendanceRepository myAttendanceRepository;

  @override
  Future<CustomResponseType<BaseEntity<MyAttendanceEntity>>> call() {
    return myAttendanceRepository.getMyAttendance();
  }
}
