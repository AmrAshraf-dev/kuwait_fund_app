import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/certificates_request_model.dart';
import '../../models/response/certificates_response_model.dart';

abstract class CertificatesRemoteDataSource {
  Future<CustomResponseType<CertificatesResponseModel>> getCertificates(
      {required CertificatesRequestModel certificatesRequestModel});
}

@Injectable(as: CertificatesRemoteDataSource)
class CertificatesDataSourceImpl implements CertificatesRemoteDataSource {
  CertificatesDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<CertificatesResponseModel>> getCertificates(
      {required CertificatesRequestModel certificatesRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper
        .post(path: ApiConstants.profile, data: <String, String>{
      "email": certificatesRequestModel.email ?? "",
      "lang": certificatesRequestModel.lang ?? "a"
    });

    if (result.success) {
   
      return right(CertificatesResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
