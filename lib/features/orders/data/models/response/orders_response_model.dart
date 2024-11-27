
import 'package:json_annotation/json_annotation.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/orders_entity.dart';

part 'orders_response_model.g.dart';



/// Model that transforms the Orders data from the API to the
/// application entity
  
  /*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */
  


@JsonSerializable()
class OrdersModel extends OrdersEntity {
  OrdersModel(
      {
   required super.var1,
    required super.var2,});

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersModelToJson(this);
}

@JsonSerializable()
class OrdersResponseModel extends BaseEntity<OrdersModel> {
  const OrdersResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory OrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersResponseModelToJson(this);
}