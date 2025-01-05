import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

class EmergencyReminingLeaveBalanceState {
  final bool showDetails;
  final int? selectedDays;
  EmergencyReminingLeaveBalanceState(
      {this.showDetails = false, this.selectedDays});

  EmergencyReminingLeaveBalanceState copyWith(
      {bool? showDetails = false, int? selectedDays}) {
    return EmergencyReminingLeaveBalanceState(
      showDetails: showDetails ?? this.showDetails,
      selectedDays: selectedDays ?? this.selectedDays,
    );
  }
}

@injectable
class EmergencyReminingLeaveBalanceCubit
    extends Cubit<EmergencyReminingLeaveBalanceState> {
  EmergencyReminingLeaveBalanceCubit()
      : super(EmergencyReminingLeaveBalanceState());

  void updateFormState({required bool showDetails, int? selectedDays}) {
    emit(state.copyWith(showDetails: showDetails, selectedDays: selectedDays));
  }
}
