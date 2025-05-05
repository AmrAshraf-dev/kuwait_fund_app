import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/my_attendance_entity.dart';

part 'in_out_time_response_model.g.dart';

@JsonSerializable()
class InOutTimeModel extends InOutTimeEntity {
  const InOutTimeModel({
    required super.inTime,
    required super.outTime,
  });

  factory InOutTimeModel.fromJson(Map<String, dynamic> json) =>
      _$InOutTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$InOutTimeModelToJson(this);
}
