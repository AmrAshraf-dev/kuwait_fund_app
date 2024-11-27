
import 'package:json_annotation/json_annotation.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/account_entity.dart';

part 'account_response_model.g.dart';



/// Model that transforms the Account data from the API to the
/// application entity
  
  /*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */
  


@JsonSerializable()
class AccountModel extends AccountEntity {
  AccountModel(
      {
   required super.var1,
    required super.var2,});

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}

@JsonSerializable()
class AccountResponseModel extends BaseEntity<AccountModel> {
  const AccountResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory AccountResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountResponseModelToJson(this);
}