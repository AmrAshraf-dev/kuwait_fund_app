import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/loan_entity.dart';

import '../../../../core/network/base_handling.dart';
import '../../../operations/data/data_sources/remote/operations_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/operations_repository.dart';
import '../models/request/operations_request_model.dart';
import '../models/response/operations_response_model.dart';

@Injectable(as: OperationsRepository)
class OperationsRepositoryImp implements OperationsRepository {
  OperationsRepositoryImp({
    required this.operationsRemoteDataSource,
  });

  final OperationsRemoteDataSource operationsRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<OperationsModel>>> getOperations(
      {required OperationsRequestModel operationsParams}) async {
    return await operationsRemoteDataSource.getOperations(
        operationsRequestModel: operationsParams);
  }

  @override
  Future<CustomResponseType<BaseEntity<List<LoanEntity>>>> getLoan() async {
    final response = await operationsRemoteDataSource.getLoan();

    return response.fold(
        (ifLeft) => Left(ifLeft), (ifRight) => Right(ifRight.toEntity()));
  }
}
