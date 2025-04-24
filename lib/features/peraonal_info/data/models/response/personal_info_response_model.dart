import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/peraonal_info/domain/entities/personal_info_entity.dart';

import '../../../../shared/entity/base_entity.dart';

part 'personal_info_response_model.g.dart';

/// Model that transforms the Profile data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class PersonalInfoModel extends PersonalInfoEntity {
  const PersonalInfoModel({
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
    super.mobile,
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoModelToJson(this);
}

@JsonSerializable()
class EmployeeAddressModel extends PersonalInfoEntity {
  const EmployeeAddressModel({
    super.apartmentNumber,
    super.building,
    super.street,
    super.city,
    super.block,
    super.avenue,
    super.attachmentInfo,
    super.phone1,
    super.phone2,
  });

  factory EmployeeAddressModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeAddressModelToJson(this);
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
