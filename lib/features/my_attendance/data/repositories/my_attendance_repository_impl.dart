


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/my_attendance_repository.dart';
import '../models/request/my_attendance_request_model.dart';
import '../models/response/my_attendance_response_model.dart';
import '../../../my_attendance/data/data_sources/remote/my_attendance_remote_data_source.dart';

@Injectable(as: MyAttendanceRepository)
class MyAttendanceRepositoryImp implements MyAttendanceRepository {
  MyAttendanceRepositoryImp({
    required this.myAttendanceRemoteDataSource,
  });

  final MyAttendanceRemoteDataSource myAttendanceRemoteDataSource;

  Future<CustomResponseType<BaseEntity<MyAttendanceModel>>> getMyAttendance(
      {required MyAttendanceRequestModel myAttendanceParams}) async {
    return await myAttendanceRemoteDataSource.getMyAttendance(
        myAttendanceRequestModel: myAttendanceParams);
  }
}


