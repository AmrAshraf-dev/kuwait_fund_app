import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/my_attendance_request_model.dart';
import '../../models/response/my_attendance_response_model.dart';

abstract class MyAttendanceRemoteDataSource {
  Future<CustomResponseType<MyAttendanceResponseModel>> getMyAttendance(
      {required MyAttendanceRequestModel myAttendanceRequestModel});
}

@Injectable(as: MyAttendanceRemoteDataSource)
class MyAttendanceDataSourceImpl implements MyAttendanceRemoteDataSource {
  MyAttendanceDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<MyAttendanceResponseModel>> getMyAttendance(
      {required MyAttendanceRequestModel myAttendanceRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": myAttendanceRequestModel.email ?? "",
      "lang": myAttendanceRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(MyAttendanceResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
