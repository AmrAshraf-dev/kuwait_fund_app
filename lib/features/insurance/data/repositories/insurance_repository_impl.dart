import 'package:injectable/injectable.dart';
import '../models/request/create_insurance_request_model.dart';
import '../models/response/insurance_details_response_model.dart';
import '../models/response/insurance_programs_response_model.dart';
import '../../domain/entities/family_member_entity.dart';
import '../../domain/entities/insurance_entity.dart';
import '../../domain/entities/subscriber_entity.dart';

import '../../../../core/network/base_handling.dart';
import '../../../insurance/data/data_sources/remote/insurance_remote_data_source.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/insurance_repository.dart';

@Injectable(as: InsuranceRepository)
class InsuranceRepositoryImp implements InsuranceRepository {
  InsuranceRepositoryImp({
    required this.insuranceRemoteDataSource,
  });

  final InsuranceRemoteDataSource insuranceRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<List<InsuranceProgramsModel>>>>
      getInsurancePrograms() async {
    return await insuranceRemoteDataSource.getInsurancePrograms();
  }

  @override
  Future<CustomResponseType<BaseEntity<InsuranceDetailsModel>>>
      getInsuranceMasterInfo() async {
    return await insuranceRemoteDataSource.getInsuranceMasterInfo();
  }

  @override
  Future<CustomResponseType<BaseEntity<String>>> unsubscribeInsurance() async {
    return await insuranceRemoteDataSource.unsubscribeInsurance();
  }

  @override
  Future<CustomResponseType<BaseEntity<List<FamilyMemberEntity>>>>
      getFamilyMembers() async {
    return await insuranceRemoteDataSource.getFamilyMembers();
  }

  @override
  Future<CustomResponseType<BaseEntity<List<SubscriberEntity>>>>
      getSubscribers() async {
    return await insuranceRemoteDataSource.getSubscribers();
  }

  @override
  Future<CustomResponseType<BaseEntity<InsuranceEntity>>>
      createInsuranceRequest(
          {required CreateInsuranceRequestModel insuranceRequestModel}) {
    return insuranceRemoteDataSource.createInsuranceRequest(
        insuranceRequestModel: insuranceRequestModel);
  }
}
