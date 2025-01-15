import 'package:injectable/injectable.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../repositories/certificates_repository.dart";

@injectable
class GenerateCertificateUserCase
    implements UseCase<BaseEntity<String>, String> {
  GenerateCertificateUserCase({required this.certificatesRepository});

  final CertificatesRepository certificatesRepository;

  @override
  Future<CustomResponseType<BaseEntity<String>>> call(statmentType) {
    return certificatesRepository.generateCertificate(statmentType);
  }
}
