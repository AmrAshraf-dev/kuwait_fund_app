


import "package:kf_ess_mobile_app/features/ads/domain/entities/ads_entity.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

 



/// Data operations for the Ads collection
abstract class AdsRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity<List< AdsEntity>>>> getAds(int pageNumber );
}
