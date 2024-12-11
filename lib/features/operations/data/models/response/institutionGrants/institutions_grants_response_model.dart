import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/institution_grants_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'institutions_grants_response_model.g.dart';

@JsonSerializable()
class InstitutionGrantsModel extends InstitutionGrantsEntity {
  InstitutionGrantsModel(
      {required super.instituteName,
      required super.numberOfGrants,
      required super.valueOfGrants});
  factory InstitutionGrantsModel.fromJson(Map<String, dynamic> json) =>
      _$InstitutionGrantsModelFromJson(json);

  Map<String, dynamic> toJson() => _$InstitutionGrantsModelToJson(this);
}

@JsonSerializable()
class InstitutionsGrantsResponseModel
    extends BaseEntity<List<InstitutionGrantsModel>> {
  const InstitutionsGrantsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });
  factory InstitutionsGrantsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InstitutionsGrantsResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InstitutionsGrantsResponseModelToJson(this);
}
