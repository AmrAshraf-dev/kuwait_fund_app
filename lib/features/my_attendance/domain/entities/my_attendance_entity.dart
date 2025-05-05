import "package:equatable/equatable.dart";
import "../../data/models/response/attendance_data_response_model.dart";
import "../../data/models/response/in_out_time_response_model.dart";

/// Entity that contains the data of the MyAttendance.
class MyAttendanceEntity extends Equatable {
  final String? availableHours;

  final String? usedHours;
  final String? delayHours;

  final List<AttendanceDataModel> attendanceData;

  /// Entity that contains the data of the MyAttendance.
  const MyAttendanceEntity(
      {required this.availableHours,
      required this.usedHours,
      required this.delayHours,
      required this.attendanceData});

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        /*
  List your entity attributes here 
  */
      ];
}

class AttendanceDataEntity {
  final String? attendanceDate;
  final List<InOutTimeModel> inOutInfo;
  const AttendanceDataEntity(
      {required this.attendanceDate, required this.inOutInfo});
}

class InOutTimeEntity {
  final String? inTime;
  final String? outTime;
  const InOutTimeEntity({required this.inTime, required this.outTime});
}
