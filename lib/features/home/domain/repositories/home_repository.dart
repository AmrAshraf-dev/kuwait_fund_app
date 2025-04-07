


import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

 import "../entities/home_entity.dart";



/// Data operations for the Home collection
abstract class HomeRepository {

  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */
  

  Future<CustomResponseType<BaseEntity< HomeEntity>>> getHome();
}
