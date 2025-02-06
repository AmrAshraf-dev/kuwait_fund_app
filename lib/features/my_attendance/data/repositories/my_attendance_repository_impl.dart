import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../my_attendance/data/data_sources/remote/my_attendance_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/my_attendance_repository.dart';
import '../models/response/my_attendance_response_model.dart';

@Injectable(as: MyAttendanceRepository)
class MyAttendanceRepositoryImp implements MyAttendanceRepository {
  MyAttendanceRepositoryImp({
    required this.myAttendanceRemoteDataSource,
  });

  final MyAttendanceRemoteDataSource myAttendanceRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<MyAttendanceModel>>>
      getMyAttendance() async {
    return await myAttendanceRemoteDataSource.getMyAttendance();
  }
}
