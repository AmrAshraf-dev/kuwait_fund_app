
import 'package:json_annotation/json_annotation.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/forget_pass_entity.dart';

part 'forget_pass_response_model.g.dart';



/// Model that transforms the ForgetPass data from the API to the
/// application entity
  
  /*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */
  


@JsonSerializable()
class ForgetPassModel extends ForgetPassEntity {
  ForgetPassModel(
      {
   required super.var1,
    required super.var2,});

  factory ForgetPassModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPassModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPassModelToJson(this);
}

@JsonSerializable()
class ForgetPassResponseModel extends BaseEntity<ForgetPassModel> {
  const ForgetPassResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory ForgetPassResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPassResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPassResponseModelToJson(this);
}