part of 'annual_leave_details_history_cubit.dart';

class AnnualLeaveDetailsHistoryErrorState
    extends AnnualLeaveDetailsHistoryState {
  final String? message;

  AnnualLeaveDetailsHistoryErrorState({this.message});
}

final class AnnualLeaveDetailsHistoryInitialState
    extends AnnualLeaveDetailsHistoryState {}

final class AnnualLeaveDetailsHistoryLoadingState
    extends AnnualLeaveDetailsHistoryState {}

final class AnnualLeaveDetailsHistoryEmptyState
    extends AnnualLeaveDetailsHistoryState {}

final class AnnualLeaveDetailsHistoryReadyState
    extends AnnualLeaveDetailsHistoryState {
  AnnualLeaveDetailsHistoryReadyState(this.response);
  BaseEntity<List<AnnualLeaveDetailsEntity>> response;
}

abstract class AnnualLeaveDetailsHistoryState {}
