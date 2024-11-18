
import 'package:json_annotation/json_annotation.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/peraonal_info_entity.dart';

part 'peraonal_info_response_model.g.dart';



/// Model that transforms the PeraonalInfo data from the API to the
/// application entity
  
  /*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */
  


@JsonSerializable()
class PeraonalInfoModel extends PeraonalInfoEntity {
  PeraonalInfoModel(
      {
   required super.var1,
    required super.var2,});

  factory PeraonalInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PeraonalInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeraonalInfoModelToJson(this);
}

@JsonSerializable()
class PeraonalInfoResponseModel extends BaseEntity<PeraonalInfoModel> {
  const PeraonalInfoResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory PeraonalInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PeraonalInfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeraonalInfoResponseModelToJson(this);
}