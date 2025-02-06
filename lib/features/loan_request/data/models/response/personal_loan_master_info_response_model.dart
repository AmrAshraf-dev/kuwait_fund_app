import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import '../../../domain/entities/personal_loan_master_info_entity.dart';

part 'personal_loan_master_info_response_model.g.dart';

@JsonSerializable()
class PersonalLoanMasterInfoModel extends PersonalLoanMasterInfoEntity {
  PersonalLoanMasterInfoModel({
    required super.personalLoanRequestID,
    required super.employeeName,
    required super.loanAmount,
    required super.noOfInstalments,
    required super.installmentAmount,
    required super.applicationDate,
    required super.approvalType,
    required super.remarks,
    required super.reasonLabel,
    required super.maxLoanAmount,
  });

  factory PersonalLoanMasterInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalLoanMasterInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalLoanMasterInfoModelToJson(this);
}

@JsonSerializable()
class PersonalLoanMasterInfoResponseModel
    extends BaseEntity<PersonalLoanMasterInfoModel> {
  const PersonalLoanMasterInfoResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory PersonalLoanMasterInfoResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$PersonalLoanMasterInfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PersonalLoanMasterInfoResponseModelToJson(this);
}
