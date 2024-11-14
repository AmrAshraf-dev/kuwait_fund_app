import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/certificates_request_model.dart";
import "../entities/certificates_entity.dart";
import "../repositories/certificates_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetCertificatesUseCase implements UseCase<BaseEntity<CertificatesEntity>, CertificatesRequestModel> {
    GetCertificatesUseCase ({required this.certificatesRepository});

  final CertificatesRepository certificatesRepository;


  @override
  Future<CustomResponseType<BaseEntity<CertificatesEntity>>> call(
    CertificatesRequestModel params,
  ) {
    
    
    return certificatesRepository.getCertificates(certificatesParams: params);
    
  }
}
