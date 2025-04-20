// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_grants_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryGrantsModel _$CountryGrantsModelFromJson(Map<String, dynamic> json) =>
    CountryGrantsModel(
      countryName: json['countryName'] as String?,
      numberOfGrants: (json['numberOfGrants'] as num?)?.toInt(),
      valueOfGrants: json['valueOfGrants'] as String?,
    );

Map<String, dynamic> _$CountryGrantsModelToJson(CountryGrantsModel instance) =>
    <String, dynamic>{
      if (instance.countryName case final value?) 'countryName': value,
      if (instance.numberOfGrants case final value?) 'numberOfGrants': value,
      if (instance.valueOfGrants case final value?) 'valueOfGrants': value,
    };

CountriesGrantsResponseModel _$CountriesGrantsResponseModelFromJson(
        Map<String, dynamic> json) =>
    CountriesGrantsResponseModel(
      code: (json['code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CountryGrantsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$CountriesGrantsResponseModelToJson(
        CountriesGrantsResponseModel instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.code case final value?) 'code': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.totalRecords case final value?) 'totalRecords': value,
      if (instance.hasMorePages case final value?) 'hasMorePages': value,
    };
