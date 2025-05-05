import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/map_coordinates_entity.dart';

part 'map_coordinates_response_model.g.dart';

/// Model that transforms the Contactus data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class MapCoordinatesModel extends MapCoordinatesEntity {
  const MapCoordinatesModel({
    required super.latitude,
    required super.longitude,
    
  });

  factory MapCoordinatesModel.fromJson(Map<String, dynamic> json) =>
      _$MapCoordinatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MapCoordinatesModelToJson(this);
}
