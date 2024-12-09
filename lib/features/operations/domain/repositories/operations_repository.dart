import "package:kf_ess_mobile_app/features/operations/domain/entities/contribution_entity.dart";
import "package:kf_ess_mobile_app/features/operations/domain/entities/country_grants_entity.dart";
import "package:kf_ess_mobile_app/features/operations/domain/entities/institution_grants_entity.dart";
import "package:kf_ess_mobile_app/features/operations/domain/entities/loan/loan_entity.dart";

import "../../../../core/network/base_handling.dart";
import "../../../shared/entity/base_entity.dart";
import "../../data/models/request/operations_request_model.dart";
import "../entities/operations_entity.dart";

/// Data operations for the Operations collection
abstract class OperationsRepository {
  /*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */

  Future<CustomResponseType<BaseEntity<OperationsEntity>>> getOperations({
    required OperationsRequestModel operationsParams,
  });

  Future<CustomResponseType<BaseEntity<List<LoanEntity>>>> getLoan();

  Future<CustomResponseType<BaseEntity<List<CountryGrantsEntity>>>>
      getCountriesGrants();

  Future<CustomResponseType<BaseEntity<List<InstitutionGrantsEntity>>>>
      getInstitutionsGrants();

  Future<CustomResponseType<BaseEntity<List<ContributionEntity>>>>
      getContributions();
}
