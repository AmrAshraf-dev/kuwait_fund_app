import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/insurance/data/models/response/insurance_details_response_model.dart';

import '../../../../core/network/base_handling.dart';
import '../../../insurance/data/data_sources/remote/insurance_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/insurance_repository.dart';
import '../models/response/insurance_response_model.dart';

@Injectable(as: InsuranceRepository)
class InsuranceRepositoryImp implements InsuranceRepository {
  InsuranceRepositoryImp({
    required this.insuranceRemoteDataSource,
  });

  final InsuranceRemoteDataSource insuranceRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<List<InsuranceModel>>>>
      getInsurancePrograms() async {
    return await insuranceRemoteDataSource.getInsurancePrograms();
  }

  @override
  Future<CustomResponseType<BaseEntity<InsuranceDetailsModel>>>
      getInsuranceDetails() async {
    return await insuranceRemoteDataSource.getInsuranceDetails();
  }

  @override
  Future<CustomResponseType<BaseEntity<String>>> unsubscribeInsurance() async {
    return await insuranceRemoteDataSource.unsubscribeInsurance();
  }
}
