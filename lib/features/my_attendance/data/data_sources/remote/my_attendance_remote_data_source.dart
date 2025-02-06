import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/response/my_attendance_response_model.dart';

abstract class MyAttendanceRemoteDataSource {
  Future<CustomResponseType<MyAttendanceResponseModel>> getMyAttendance();
}

@Injectable(as: MyAttendanceRemoteDataSource)
class MyAttendanceDataSourceImpl implements MyAttendanceRemoteDataSource {
  MyAttendanceDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<MyAttendanceResponseModel>>
      getMyAttendance() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.getAttendanceDetails);

    if (result.success) {
      return right(MyAttendanceResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
