import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/operations/data/models/response/loan_response_model.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/operations_request_model.dart';
import '../../models/response/operations_response_model.dart';

abstract class OperationsRemoteDataSource {
  Future<CustomResponseType<OperationsResponseModel>> getOperations(
      {required OperationsRequestModel operationsRequestModel});

  Future<CustomResponseType<LoanResponseModel>> getLoan();
}

@Injectable(as: OperationsRemoteDataSource)
class OperationsDataSourceImpl implements OperationsRemoteDataSource {
  OperationsDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<OperationsResponseModel>> getOperations(
      {required OperationsRequestModel operationsRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.loan, data: <String, String>{
      "email": operationsRequestModel.email ?? "",
      "lang": operationsRequestModel.lang ?? "a"
    });

    if (result.success) {
      return right(OperationsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<LoanResponseModel>> getLoan() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.loan);

    if (result.success) {
      return right(LoanResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
