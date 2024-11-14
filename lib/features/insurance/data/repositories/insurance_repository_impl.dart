


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/insurance_repository.dart';
import '../models/request/insurance_request_model.dart';
import '../models/response/insurance_response_model.dart';
import '../../../insurance/data/data_sources/remote/insurance_remote_data_source.dart';

@Injectable(as: InsuranceRepository)
class InsuranceRepositoryImp implements InsuranceRepository {
  InsuranceRepositoryImp({
    required this.insuranceRemoteDataSource,
  });

  final InsuranceRemoteDataSource insuranceRemoteDataSource;

  Future<CustomResponseType<BaseEntity<InsuranceModel>>> getInsurance(
      {required InsuranceRequestModel insuranceParams}) async {
    return await insuranceRemoteDataSource.getInsurance(
        insuranceRequestModel: insuranceParams);
  }
}


