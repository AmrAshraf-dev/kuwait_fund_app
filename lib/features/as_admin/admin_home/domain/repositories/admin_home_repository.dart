import "../../../../../core/network/base_handling.dart";
import "../../../../shared/entity/base_entity.dart";
import "../../data/models/request/admin_home_request_model.dart";
import "../entities/admin_home_entity.dart";

/// Data operations for the AdminHome collection
abstract class AdminHomeRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<AdminHomeEntity>>> getAdminHome({
    required AdminHomeRequestModel adminHomeParams,
  });
}
