


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/certificates_request_model.dart";
import "../entities/certificates_entity.dart";



/// Data operations for the Certificates collection
abstract class CertificatesRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< CertificatesEntity>>> getCertificates({
    required CertificatesRequestModel certificatesParams,
  });
}
