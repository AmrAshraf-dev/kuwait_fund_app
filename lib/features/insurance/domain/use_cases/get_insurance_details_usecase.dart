import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/domain/usecase/base_usecase.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';

import '../../../shared/entity/base_entity.dart';
import '../entities/insurance_entity.dart';
import '../repositories/insurance_repository.dart';

@injectable
class GetInsuranceDetailsUseCase
    implements UseCaseNoParam<BaseEntity<InsuranceEntity>> {
  final InsuranceRepository repository;

  GetInsuranceDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, BaseEntity<InsuranceEntity>>> call() async {
    return await repository.getInsuranceDetails();
  }
}
