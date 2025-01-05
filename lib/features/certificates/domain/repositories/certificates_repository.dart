import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";
import "../entities/certificates_entity.dart";

/// Data operations for the Certificates collection
abstract class CertificatesRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<List<CertificatesEntity>>>>
      getCertificates();
}
