import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../certificates/data/data_sources/remote/certificates_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/certificates_repository.dart';
import '../models/response/certificates_response_model.dart';

@Injectable(as: CertificatesRepository)
class CertificatesRepositoryImp implements CertificatesRepository {
  CertificatesRepositoryImp({
    required this.certificatesRemoteDataSource,
  });

  final CertificatesRemoteDataSource certificatesRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<List<CertificatesModel>>>>
      getCertificates() async {
    return await certificatesRemoteDataSource.getCertificates();
  }
}
