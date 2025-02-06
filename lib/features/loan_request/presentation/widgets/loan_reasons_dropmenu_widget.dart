import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/loan_request/domain/entities/personal_loan_reason_entity.dart';
import 'package:kf_ess_mobile_app/features/loan_request/presentation/cubits/loan_reasons_cubit/loan_reasons_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';

class LoanReasonsDropMenuWidget extends StatelessWidget {
  const LoanReasonsDropMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanReasonsCubit, LoanReasonsState>(
      builder: (context, state) {
        if (state is LoanReasonsLoadingState) {
          ViewsToolbox.showLoading();
        } else if (state is LoanReasonsErrorState) {
          ViewsToolbox.dismissLoading();
          ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
        } else if (state is LoanReasonsReadyState) {
          ViewsToolbox.dismissLoading();
          final loanReasonsResponse = state.response;
          return CustomDropDownField<PersonalLoanReasonEntity>(
            keyName: "purposeOfLoan",
            labelText: context.tr("purpose_of_loan"),
            disableSearch: true,
            disableFiled: false,
            labelAboveField: context.tr("purpose_of_loan"),
            onChanged: (
              PersonalLoanReasonEntity? newSelectedService,
            ) {},
            items: loanReasonsResponse.data == null
                ? []
                : loanReasonsResponse.data!
                    .map((PersonalLoanReasonEntity item) {
                    return DropdownMenuItem<PersonalLoanReasonEntity>(
                      value: item,
                      child: AppText(
                        text: item.name,
                        style: AppTextStyle.regular_16,
                      ),
                    );
                  }).toList(),
            validator: (PersonalLoanReasonEntity? value) =>
                AppValidator.validatorRequired(
              value,
              context,
            ),
          );
        }
        return Container();
      },
    );
  }
}
