import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/personal_info_entity.dart';

part 'personal_info_response_model.g.dart';

/// Model that transforms the PeraonalInfo data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class PersonalInfoModel extends PersonalInfoEntity {
  PersonalInfoModel({
    super.employeeNumber,
    super.name,
    super.designationName,
    super.email,
    super.phone1,
    super.phone2,
    super.civilID,
    super.recidancyExpiryDate,
    super.nationalityName,
    super.passportExpiryDate,
    super.contractTypeName,
    super.contactStartDate,
    super.contactEndDate,
    super.joiningDate,
    super.attachmentInfo,
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoModelToJson(this);
}

@JsonSerializable()
class PersonalInfoResponseModel extends BaseEntity<PersonalInfoModel> {
  const PersonalInfoResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory PersonalInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoResponseModelToJson(this);
}
