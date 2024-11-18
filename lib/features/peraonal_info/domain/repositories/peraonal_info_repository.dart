


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/peraonal_info_request_model.dart";
import "../entities/peraonal_info_entity.dart";



/// Data operations for the PeraonalInfo collection
abstract class PeraonalInfoRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< PeraonalInfoEntity>>> getPeraonalInfo({
    required PeraonalInfoRequestModel peraonalInfoParams,
  });
}
