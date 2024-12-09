import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/country_grants_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'countries_grants_response_model.g.dart';

@JsonSerializable()
class CountryGrantsModel extends CountryGrantsEntity {
  CountryGrantsModel(
      {required super.countryName,
      required super.numberOfGrants,
      required super.valueOfGrants});
  factory CountryGrantsModel.fromJson(Map<String, dynamic> json) =>
      _$CountryGrantsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryGrantsModelToJson(this);
}

@JsonSerializable()
class CountriesGrantsResponseModel
    extends BaseEntity<List<CountryGrantsModel>> {
  const CountriesGrantsResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });
  factory CountriesGrantsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesGrantsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesGrantsResponseModelToJson(this);
}
