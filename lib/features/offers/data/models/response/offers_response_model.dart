
import 'package:json_annotation/json_annotation.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/offers_entity.dart';

part 'offers_response_model.g.dart';



/// Model that transforms the Offers data from the API to the
/// application entity
  
  /*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */
  


@JsonSerializable()
class OffersModel extends OffersEntity {
  OffersModel(
      {
   required super.var1,
    required super.var2,});

  factory OffersModel.fromJson(Map<String, dynamic> json) =>
      _$OffersModelFromJson(json);

  Map<String, dynamic> toJson() => _$OffersModelToJson(this);
}

@JsonSerializable()
class OffersResponseModel extends BaseEntity<OffersModel> {
  const OffersResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory OffersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OffersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OffersResponseModelToJson(this);
}