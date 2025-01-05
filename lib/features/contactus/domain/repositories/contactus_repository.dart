import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";
import "../entities/contactus_entity.dart";

/// Data operations for the Contactus collection
abstract class ContactusRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<ContactusEntity>>> getContactus();
  Future<CustomResponseType<BaseEntity<ContactusEntity>>> getMapCoordinates();
  Future<CustomResponseType<BaseEntity<ContactusEntity>>> getTelephoneFax();
}
