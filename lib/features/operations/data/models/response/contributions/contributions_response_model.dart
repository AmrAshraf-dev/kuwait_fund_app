import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/entities/contribution_entity.dart';
import '../../../../../shared/entity/base_entity.dart';

part 'contributions_response_model.g.dart';

@JsonSerializable()
class ContributionModel extends ContributionEntity {
  ContributionModel(
      {required super.committedAmount,
      required super.foundationName,
      required super.paidUpAmount});
  factory ContributionModel.fromJson(Map<String, dynamic> json) =>
      _$ContributionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContributionModelToJson(this);
}

@JsonSerializable()
class ContributionsResponseModel extends BaseEntity<List<ContributionModel>> {
  const ContributionsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });
  factory ContributionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContributionsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContributionsResponseModelToJson(this);
}
