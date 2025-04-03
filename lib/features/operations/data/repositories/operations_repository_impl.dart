import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/contribution_entity.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/country_grants_entity.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/institution_grants_entity.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/loan/loan_entity.dart';

import '../../../../core/network/base_handling.dart';
import '../../../operations/data/data_sources/remote/operations_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/operations_repository.dart';
import '../models/request/operations_request_model.dart';

@Injectable(as: OperationsRepository)
class OperationsRepositoryImp implements OperationsRepository {
  OperationsRepositoryImp({
    required this.operationsRemoteDataSource,
  });

  final OperationsRemoteDataSource operationsRemoteDataSource;


  @override
  Future<CustomResponseType<BaseEntity<List<LoanEntity>>>> getLoan() async {
    final response = await operationsRemoteDataSource.getLoan();

    return response.fold(
        (ifLeft) => Left(ifLeft), (ifRight) => Right(ifRight.toEntity()));
  }

  @override
  Future<CustomResponseType<BaseEntity<List<CountryGrantsEntity>>>>
      getCountriesGrants() async {
    return await operationsRemoteDataSource.getCountriesGrants();
  }

  @override
  Future<CustomResponseType<BaseEntity<List<InstitutionGrantsEntity>>>>
      getInstitutionsGrants() async {
    return await operationsRemoteDataSource.getInstitutionsGrants();
  }

  @override
  Future<Either<Failure, BaseEntity<List<ContributionEntity>>>>
      getContributions() async {
    return operationsRemoteDataSource.getContributions();
  }
}
