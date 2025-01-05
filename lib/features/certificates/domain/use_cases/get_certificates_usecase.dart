import 'package:injectable/injectable.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../entities/certificates_entity.dart";
import "../repositories/certificates_repository.dart";

@injectable
class GetCertificatesUseCase
    implements UseCaseNoParam<BaseEntity<List<CertificatesEntity>>> {
  GetCertificatesUseCase({required this.certificatesRepository});

  final CertificatesRepository certificatesRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<CertificatesEntity>>>> call() {
    return certificatesRepository.getCertificates();
  }
}
