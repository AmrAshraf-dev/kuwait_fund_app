import "../entities/contribution_entity.dart";
import "../entities/country_grants_entity.dart";
import "../entities/institution_grants_entity.dart";
import "../entities/loan/loan_entity.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";

/// Data operations for the Operations collection
abstract class OperationsRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<List<LoanEntity>>>> getLoan();

  Future<CustomResponseType<BaseEntity<List<CountryGrantsEntity>>>>
      getCountriesGrants();

  Future<CustomResponseType<BaseEntity<List<InstitutionGrantsEntity>>>>
      getInstitutionsGrants();

  Future<CustomResponseType<BaseEntity<List<ContributionEntity>>>>
      getContributions();
}
