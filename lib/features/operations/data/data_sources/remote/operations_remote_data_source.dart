import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/operations/data/models/response/contributions/contributions_response_model.dart';
import 'package:kf_ess_mobile_app/features/operations/data/models/response/countryGrants/countries_grants_response_model.dart';
import 'package:kf_ess_mobile_app/features/operations/data/models/response/institutionGrants/institutions_grants_response_model.dart';
import 'package:kf_ess_mobile_app/features/operations/data/models/response/loan/loan_response_model.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';

abstract class OperationsRemoteDataSource {


  Future<CustomResponseType<LoanResponseModel>> getLoan();

  Future<CustomResponseType<CountriesGrantsResponseModel>> getCountriesGrants();

  Future<CustomResponseType<InstitutionsGrantsResponseModel>>
      getInstitutionsGrants();

  Future<CustomResponseType<ContributionsResponseModel>> getContributions();
}

@Injectable(as: OperationsRemoteDataSource)
class OperationsDataSourceImpl implements OperationsRemoteDataSource {
  OperationsDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<LoanResponseModel>> getLoan() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.loan);

    if (result.success) {
      return right(LoanResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<CountriesGrantsResponseModel>>
      getCountriesGrants() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.countriesGrants);

    if (result.success) {
      return right(CountriesGrantsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<InstitutionsGrantsResponseModel>>
      getInstitutionsGrants() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.institutionsGrants);

    if (result.success) {
      return right(InstitutionsGrantsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<ContributionsResponseModel>>
      getContributions() async {
    ({dynamic response, bool success}) result =
        await networkHelper.get(path: ApiConstants.contributions);

    if (result.success) {
      return right(ContributionsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
