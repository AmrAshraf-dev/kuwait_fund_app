import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/my_attendance_request_model.dart";
import "../entities/my_attendance_entity.dart";
import "../repositories/my_attendance_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetMyAttendanceUseCase implements UseCase<BaseEntity<MyAttendanceEntity>, MyAttendanceRequestModel> {
    GetMyAttendanceUseCase ({required this.myAttendanceRepository});

  final MyAttendanceRepository myAttendanceRepository;


  @override
  Future<CustomResponseType<BaseEntity<MyAttendanceEntity>>> call(
    MyAttendanceRequestModel params,
  ) {
    
    
    return myAttendanceRepository.getMyAttendance(myAttendanceParams: params);
    
  }
}
