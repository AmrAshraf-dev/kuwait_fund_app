import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

class AnnualLeaveReminingLeaveBalanceState {
  final bool showDetails;
  final int? selectedDays;
  AnnualLeaveReminingLeaveBalanceState(
      {this.showDetails = false, this.selectedDays});

  AnnualLeaveReminingLeaveBalanceState copyWith(
      {bool? showDetails = false, int? selectedDays}) {
    return AnnualLeaveReminingLeaveBalanceState(
      showDetails: showDetails ?? this.showDetails,
      selectedDays: selectedDays ?? this.selectedDays,
    );
  }
}

@injectable
class AnnualLeaveReminingLeaveBalanceCubit
    extends Cubit<AnnualLeaveReminingLeaveBalanceState> {
  AnnualLeaveReminingLeaveBalanceCubit()
      : super(AnnualLeaveReminingLeaveBalanceState());

  void updateFormState({required bool showDetails, int? selectedDays}) {
    emit(state.copyWith(showDetails: showDetails, selectedDays: selectedDays));
  }
}
