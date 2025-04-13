part of 'annual_leave_info_cubit.dart';

class AnnualLeaveInfoErrorState extends AnnualLeaveInfoState {
  final String? message;

  AnnualLeaveInfoErrorState({this.message});
}

final class AnnualLeaveInfoInitialState extends AnnualLeaveInfoState {}

final class AnnualLeaveInfoLoadingState extends AnnualLeaveInfoState {}

final class AnnualLeaveInfoEmptyState extends AnnualLeaveInfoState {}

final class AnnualLeaveInfoReadyState extends AnnualLeaveInfoState {
  AnnualLeaveInfoReadyState(this.response);
  BaseEntity<AnnualLeaveInfoEntity> response;
}

abstract class AnnualLeaveInfoState {}
