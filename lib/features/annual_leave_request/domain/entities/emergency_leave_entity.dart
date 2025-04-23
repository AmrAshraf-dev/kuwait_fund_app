class EmergencyLeaveEntity {
  final String? emergencyString;
  final bool? canTakeLeaveFlg;
  final bool? isEmergencyLeave;
  final String? emergencyLabel;
  final int? allowedDays;
  final String? emergencyLabelDays;
  final int? availableDays;
  final int? availableHours;
  final int? availableMinutes;

  EmergencyLeaveEntity({
    this.emergencyString,
    this.canTakeLeaveFlg,
    this.isEmergencyLeave,
    this.emergencyLabel,
    this.allowedDays,
    this.emergencyLabelDays,
    this.availableDays,
    this.availableHours,
    this.availableMinutes,
  });
}