


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/certificates_repository.dart';
import '../models/request/certificates_request_model.dart';
import '../models/response/certificates_response_model.dart';
import '../../../certificates/data/data_sources/remote/certificates_remote_data_source.dart';

@Injectable(as: CertificatesRepository)
class CertificatesRepositoryImp implements CertificatesRepository {
  CertificatesRepositoryImp({
    required this.certificatesRemoteDataSource,
  });

  final CertificatesRemoteDataSource certificatesRemoteDataSource;

  Future<CustomResponseType<BaseEntity<CertificatesModel>>> getCertificates(
      {required CertificatesRequestModel certificatesParams}) async {
    return await certificatesRemoteDataSource.getCertificates(
        certificatesRequestModel: certificatesParams);
  }
}


