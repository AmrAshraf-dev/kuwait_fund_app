


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/my_attendance_request_model.dart";
import "../entities/my_attendance_entity.dart";



/// Data operations for the MyAttendance collection
abstract class MyAttendanceRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< MyAttendanceEntity>>> getMyAttendance({
    required MyAttendanceRequestModel myAttendanceParams,
  });
}
