import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

class RangeDatePickerState {
  final int? consumedDays;
  final String? errorMessage; // Add errorMessage field

  RangeDatePickerState({this.consumedDays, this.errorMessage});

  RangeDatePickerState copyWith({int? consumedDays, String? errorMessage}) {
    return RangeDatePickerState(
      consumedDays: consumedDays ?? this.consumedDays,
      errorMessage: errorMessage, // Allow updating errorMessage
    );
  }
}

@injectable
class RangeDatePickerCubit extends Cubit<RangeDatePickerState> {
  RangeDatePickerCubit() : super(RangeDatePickerState(consumedDays: 0));

  void updateConsumedDays(int selectedDays) {
    emit(state.copyWith(consumedDays: selectedDays, errorMessage: null));
  }

  void emitErrorMessage(String message) {
    emit(state.copyWith(errorMessage: message));
  }
}
