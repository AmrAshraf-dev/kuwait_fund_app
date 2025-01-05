import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/response/certificates_response_model.dart';

abstract class CertificatesRemoteDataSource {
  Future<CustomResponseType<CertificatesResponseModel>> getCertificates();
}

@Injectable(as: CertificatesRemoteDataSource)
class CertificatesDataSourceImpl implements CertificatesRemoteDataSource {
  CertificatesDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<CertificatesResponseModel>>
      getCertificates() async {
    ({dynamic response, bool success}) result = await networkHelper
        .get(path: ApiConstants.getCertificates, queryParams: {
      "userName": "TEST70",
    });

    if (result.success) {
      return right(CertificatesResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
