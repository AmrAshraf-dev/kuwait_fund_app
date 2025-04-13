part of 'leave_balance_cubit.dart';

abstract class LeaveBalanceState {}

class LeaveBalanceInitial extends LeaveBalanceState {}

class LeaveBalanceLoading extends LeaveBalanceState {}

class LeaveBalanceReadyState extends LeaveBalanceState {
  final LeaveBalanceEntity leaveBalance;
  LeaveBalanceReadyState({required this.leaveBalance});
}

class LeaveBalanceErrorState extends LeaveBalanceState {
  final String message;

  LeaveBalanceErrorState({required this.message});
}
