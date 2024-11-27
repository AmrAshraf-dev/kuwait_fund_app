
import 'package:json_annotation/json_annotation.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/stores_entity.dart';

part 'stores_response_model.g.dart';



/// Model that transforms the Stores data from the API to the
/// application entity
  
  /*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */
  


@JsonSerializable()
class StoresModel extends StoresEntity {
  StoresModel(
      {
   required super.var1,
    required super.var2,});

  factory StoresModel.fromJson(Map<String, dynamic> json) =>
      _$StoresModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoresModelToJson(this);
}

@JsonSerializable()
class StoresResponseModel extends BaseEntity<StoresModel> {
  const StoresResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory StoresResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoresResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoresResponseModelToJson(this);
}