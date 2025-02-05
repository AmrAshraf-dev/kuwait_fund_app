import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/loan_request/data/models/request/loan_request_request_model.dart';
import 'package:kf_ess_mobile_app/features/loan_request/domain/entities/personal_loan_reason_entity.dart';
import 'package:kf_ess_mobile_app/features/loan_request/presentation/cubits/loan_request_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class CreateLoanRequestScreen extends StatefulWidget {
  const CreateLoanRequestScreen({super.key});

  @override
  State<CreateLoanRequestScreen> createState() =>
      _CreateLoanRequestScreenState();
}

class _CreateLoanRequestScreenState extends State<CreateLoanRequestScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final LoanRequestCubit loanRequestCubit = getIt<LoanRequestCubit>();

  // Add controllers to manage the text fields
  final TextEditingController _loanAmountController = TextEditingController();
  final TextEditingController _numberOfInstallmentsController =
      TextEditingController();
  final TextEditingController _monthlyInstallmentController =
      TextEditingController();

  @override
  void dispose() {
    _loanAmountController.dispose();
    _numberOfInstallmentsController.dispose();
    _monthlyInstallmentController.dispose();
    super.dispose();
  }

  void _onLoanAmountChanged(String value) {
    final loanAmount = int.tryParse(value) ?? 0;
    final numberOfInstallments =
        int.tryParse(_numberOfInstallmentsController.text) ?? 1;
    loanRequestCubit.calculateInstallments(loanAmount, numberOfInstallments);
  }

  void _onNumberOfInstallmentsChanged(String value) {
    final loanAmount = int.tryParse(_loanAmountController.text) ?? 0;
    final numberOfInstallments = int.tryParse(value) ?? 1;
    loanRequestCubit.calculateInstallments(loanAmount, numberOfInstallments);
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      isBackEnabled: true,
      screenTitle: context.tr("loan"),
      widget: BlocProvider(
        create: (context) => loanRequestCubit,
        child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 20.h),
                      child: Column(
                        children: [
                          TextFieldWidget(
                            labelAboveField: context.tr("loan_amount"),
                            keyName: "loanAmount",
                            controller: _loanAmountController,
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                              ],
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: false),
                            onChanged: (value) => _onLoanAmountChanged(value),
                          ),
                          20.verticalSpace,
                          BlocBuilder<LoanRequestCubit, LoanRequestState>(
                            builder: (context, state) {
                              if (state is LoanRequestLoadingState) {
                                ViewsToolbox.showLoading();
                              } else if (state is LoanRequestErrorState) {
                                ViewsToolbox.dismissLoading();
                                ViewsToolbox.showErrorAwesomeSnackBar(
                                    context, state.message!);
                              } else if (state is LoanRequestReadyState ||
                                  state
                                      is LoanRequestInstallmentCalculatedState) {
                                ViewsToolbox.dismissLoading();

                                final loanReasonsResponse = state
                                        is LoanRequestReadyState
                                    ? state.response
                                    : (state
                                            as LoanRequestInstallmentCalculatedState)
                                        .loanReasonsResponse;

                                return CustomDropDownField<
                                    PersonalLoanReasonEntity>(
                                  keyName: "purposeOfLoan",
                                  labelText: context.tr("purpose_of_loan"),
                                  disableSearch: true,
                                  disableFiled: false,
                                  labelAboveField:
                                      context.tr("purpose_of_loan"),
                                  onChanged: (
                                    PersonalLoanReasonEntity?
                                        newSelectedService,
                                  ) {},
                                  items: loanReasonsResponse?.data == null
                                      ? []
                                      : loanReasonsResponse!.data!
                                          .map((PersonalLoanReasonEntity item) {
                                          return DropdownMenuItem<
                                              PersonalLoanReasonEntity>(
                                            value: item,
                                            child: AppText(
                                              text: item.reson,
                                              style: AppTextStyle.regular_16,
                                            ),
                                          );
                                        }).toList(),
                                  validator:
                                      (PersonalLoanReasonEntity? value) =>
                                          AppValidator.validatorRequired(
                                    value,
                                    context,
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                          20.verticalSpace,
                          TextFieldWidget(
                            labelAboveField:
                                context.tr("number_of_installments"),
                            keyName: "numberOfInstallments",
                            controller: _numberOfInstallmentsController
                              ..text = "1",
                            onChanged: (value) =>
                                _onNumberOfInstallmentsChanged(value),
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: false),
                          ),
                          20.verticalSpace,
                          BlocBuilder<LoanRequestCubit, LoanRequestState>(
                            builder: (context, state) {
                              if (state
                                  is LoanRequestInstallmentCalculatedState) {
                                _monthlyInstallmentController.text =
                                    state.monthlyInstallment.toStringAsFixed(2);
                              }
                              return TextFieldWidget(
                                labelAboveField:
                                    context.tr("monthly_installment"),
                                keyName: "monthlyInstallment",
                                controller: _monthlyInstallmentController,
                                readOnly: true,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: CustomElevatedButton(
                    text: context.tr("submit"),
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        loanRequestCubit
                            .createAnnualLeaveRequest(LoanRequestRequestModel(
                          noOfInstalments: _formKey.currentState!
                              .fields["numberOfInstallments"]!.value,
                          reasonRemarks: "",
                          applicationDate:
                              DateFormat("DD/MM/YYYY").format(DateTime.now()),
                          loanAmount: _loanAmountController.text,
                          reason: _formKey.currentState!
                              .fields["purposeOfLoan"]!.value.reson,
                        ));
                      }
                    },
                  ),
                ),
                50.verticalSpace,
              ],
            )),
      ),
    );
  }
}
