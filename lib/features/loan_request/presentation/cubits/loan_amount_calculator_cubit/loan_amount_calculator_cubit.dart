import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoanAmountCalculatorCubit
    extends Cubit<LoanRequestInstallmentCalculatedState> {
  LoanAmountCalculatorCubit()
      : super(LoanRequestInstallmentCalculatedState(
          numberOfInstallments: 0,
          monthlyInstallment: 0,
        ));

  void calculateInstallments(int loanAmount, int numberOfInstallments) {
    if (loanAmount == 0 || numberOfInstallments == 0) {
      //    emit(LoanRequestErrorState(message: "Invalid input values"));
      return;
    }

    final monthlyInstallment = loanAmount / numberOfInstallments;
    emit(LoanRequestInstallmentCalculatedState(
      numberOfInstallments: numberOfInstallments,
      monthlyInstallment: monthlyInstallment,
    ));
  }

  void onLoanAmountChanged(
      {required int loanAmount, required int numberOfInstallments}) {
    calculateInstallments(loanAmount, numberOfInstallments);
  }
}

class LoanRequestInstallmentCalculatedState {
  final int numberOfInstallments;
  final double monthlyInstallment;

  LoanRequestInstallmentCalculatedState({
    required this.numberOfInstallments,
    required this.monthlyInstallment,
  });
}
