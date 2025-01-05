import "package:kf_ess_mobile_app/features/about/domain/entities/kf_board_of_directors_entity.dart";
import "package:kf_ess_mobile_app/features/about/domain/entities/kf_managment_entity.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";
import "../entities/general_information_entity.dart";

/// Data operations for the About collection
abstract class AboutRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<List<GeneralInformationEntity>>>>
      getAbout();

  Future<CustomResponseType<BaseEntity<List<KFManagmentEntity>>>>
      getKFManagment();

  Future<CustomResponseType<BaseEntity<List<KFBoardOfDirectorsEntity>>>>
      getKFBoardOfDirectors();
}
