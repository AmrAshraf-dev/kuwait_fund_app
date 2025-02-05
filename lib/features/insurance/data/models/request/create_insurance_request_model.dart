import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/insurance/data/models/response/insurance_family_member_response_model.dart';

part 'create_insurance_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class CreateInsuranceRequestModel {
  CreateInsuranceRequestModel(
      {required this.familyMembers,
      required this.beneficiaries,
      required this.programSubscribedId,
      required this.startDate,
      required this.insuranceCompanyID});

  factory CreateInsuranceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateInsuranceRequestModelFromJson(json);
  final List<InsuranceFamilyMemberModel>? familyMembers;
  final String? beneficiaries;
  final String? programSubscribedId;
  final String? startDate;
  final String? insuranceCompanyID;

  Map<String, dynamic> toJson() => _$CreateInsuranceRequestModelToJson(this);
}
