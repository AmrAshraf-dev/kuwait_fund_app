import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/emergency_leave_request_request_model.dart';
import '../../models/response/emergency_leave_request_response_model.dart';

abstract class EmergencyLeaveRequestRemoteDataSource {
  Future<CustomResponseType<String>>
      createEmergencyLeaveRequest(
          {required EmergencyLeaveRequestRequestModel
              emergencyLeaveRequestRequestModel});

  

  Future<CustomResponseType<EmergencyLeaveRequestResponseModel>>
      getEmergencyLeaveScreen();



 
}

@Injectable(as: EmergencyLeaveRequestRemoteDataSource)
class EmergencyLeaveRequestDataSourceImpl
    implements EmergencyLeaveRequestRemoteDataSource {
  EmergencyLeaveRequestDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<String>>
      createEmergencyLeaveRequest(
          {required EmergencyLeaveRequestRequestModel
              emergencyLeaveRequestRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.post(
        path: ApiConstants.createEmergencyLeaveRequest,
        queryParams: <String, String>{
          "requestedDays":
              emergencyLeaveRequestRequestModel.requestedDays.toString()
        });

    if (result.success) {
      return right(
         result.response["data"]);
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }


  @override
  Future<CustomResponseType<EmergencyLeaveRequestResponseModel>>
      getEmergencyLeaveScreen() async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getEmergencyLeaveScreen,
    );

    if (result.success) {
      return right(EmergencyLeaveRequestResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
  
}
