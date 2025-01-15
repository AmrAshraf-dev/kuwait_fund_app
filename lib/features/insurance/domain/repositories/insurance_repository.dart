import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";
import "../entities/insurance_entity.dart";

/// Data operations for the Insurance collection
abstract class InsuranceRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<List<InsuranceEntity>>>>
      getInsurancePrograms();
  Future<CustomResponseType<BaseEntity<InsuranceEntity>>> getInsuranceDetails();
  Future<CustomResponseType<BaseEntity<String>>> unsubscribeInsurance();
}
