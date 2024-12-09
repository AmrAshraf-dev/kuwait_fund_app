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
      'countryName': instance.countryName,
      'numberOfGrants': instance.numberOfGrants,
      'valueOfGrants': instance.valueOfGrants,
    };

CountriesGrantsResponseModel _$CountriesGrantsResponseModelFromJson(
        Map<String, dynamic> json) =>
    CountriesGrantsResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
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
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
