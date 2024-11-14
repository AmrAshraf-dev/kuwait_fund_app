
import 'package:json_annotation/json_annotation.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/create_request_entity.dart';

part 'create_request_response_model.g.dart';



/// Model that transforms the CreateRequest data from the API to the
/// application entity
  
  /*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */
  


@JsonSerializable()
class CreateRequestModel extends CreateRequestEntity {
  CreateRequestModel(
      {
   required super.var1,
    required super.var2,});

  factory CreateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRequestModelToJson(this);
}

@JsonSerializable()
class CreateRequestResponseModel extends BaseEntity<CreateRequestModel> {
  const CreateRequestResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory CreateRequestResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateRequestResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRequestResponseModelToJson(this);
}