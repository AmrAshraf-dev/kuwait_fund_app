


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

import "../../data/models/request/offers_request_model.dart";
import "../entities/offers_entity.dart";



/// Data operations for the Offers collection
abstract class OffersRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< OffersEntity>>> getOffers({
    required OffersRequestModel offersParams,
  });
}
