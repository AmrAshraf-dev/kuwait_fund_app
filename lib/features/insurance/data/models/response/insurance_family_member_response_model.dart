import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/entities/family_member_entity.dart';

import '../../../../shared/entity/base_entity.dart';

part 'insurance_family_member_response_model.g.dart';

/// Model that transforms the Insurance data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class InsuranceFamilyMemberModel extends FamilyMemberEntity {
  const InsuranceFamilyMemberModel(
      {required super.dateOfBirth,
      required super.id,
      required super.name,
      required super.relativeInd,
      required super.englishName,
      required super.gender,
      required super.isSubscribed});

  factory InsuranceFamilyMemberModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceFamilyMemberModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceFamilyMemberModelToJson(this);
}

@JsonSerializable()
class InsuranceFamilyMemberResponseModel
    extends BaseEntity<List<InsuranceFamilyMemberModel>> {
  const InsuranceFamilyMemberResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory InsuranceFamilyMemberResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$InsuranceFamilyMemberResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InsuranceFamilyMemberResponseModelToJson(this);
}
