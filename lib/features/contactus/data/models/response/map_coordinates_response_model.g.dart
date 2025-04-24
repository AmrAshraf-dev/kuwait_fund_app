// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_coordinates_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapCoordinatesModel _$MapCoordinatesModelFromJson(Map<String, dynamic> json) =>
    MapCoordinatesModel(
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$MapCoordinatesModelToJson(
        MapCoordinatesModel instance) =>
    <String, dynamic>{
      if (instance.latitude case final value?) 'latitude': value,
      if (instance.longitude case final value?) 'longitude': value,
    };
