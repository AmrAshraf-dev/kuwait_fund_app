// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
// import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
// import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
// import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
// import 'package:kf_ess_mobile_app/features/loan_request/data/models/request/loan_request_request_model.dart';
// import 'package:kf_ess_mobile_app/features/loan_request/presentation/cubits/create_logn_request_cubit/create_loan_request_cubit.dart';
// import 'package:kf_ess_mobile_app/features/loan_request/presentation/cubits/loan_amount_calculator_cubit/loan_amount_calculator_cubit.dart';
// import 'package:kf_ess_mobile_app/features/loan_request/presentation/cubits/loan_reasons_cubit/loan_reasons_cubit.dart';
// import 'package:kf_ess_mobile_app/features/loan_request/presentation/cubits/loan_request_cubit.dart';
// import 'package:kf_ess_mobile_app/features/loan_request/presentation/widgets/loan_reasons_dropmenu_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

// @RoutePage()
// class CreateLoanRequestScreen extends StatefulWidget {
//   const CreateLoanRequestScreen({super.key});

//   @override
//   State<CreateLoanRequestScreen> createState() =>
//       _CreateLoanRequestScreenState();
// }

// class _CreateLoanRequestScreenState extends State<CreateLoanRequestScreen> {
//   final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
//   final LoanRequestCubit loanRequestCubit = getIt<LoanRequestCubit>();
//   final LoanReasonsCubit loanReasonsCubit = getIt<LoanReasonsCubit>();
//   final LoanAmountCalculatorCubit loanAmountCalculatorCubit =
//       getIt<LoanAmountCalculatorCubit>();

//   final CreateLoanRequestCubit createLoanRequestCubit =
//       getIt<CreateLoanRequestCubit>();
//   // Add controllers to manage the text fields
//   final TextEditingController _loanAmountController = TextEditingController();
//   final TextEditingController _numberOfInstallmentsController =
//       TextEditingController();
//   final TextEditingController _monthlyInstallmentController =
//       TextEditingController();

//   @override
//   void dispose() {
//     _loanAmountController.dispose();
//     _numberOfInstallmentsController.dispose();
//     _monthlyInstallmentController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MasterWidget(
//       isBackEnabled: true,
//       screenTitle: context.tr("loan"),
//       widget: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (context) => loanRequestCubit,
//           ),
//           BlocProvider(
//             create: (context) => loanReasonsCubit,
//           ),
//           BlocProvider(
//             create: (context) => loanAmountCalculatorCubit,
//           ),
//           BlocProvider(
//             create: (context) => createLoanRequestCubit,
//           ),
//         ],
//         child: BlocBuilder<LoanRequestCubit, LoanRequestState>(
//           builder: (context, state) {
//             if (state is LoanRequestLoadingState) {
//               ViewsToolbox.showLoading();
//             } else if (state is LoanRequestErrorState) {
//               ViewsToolbox.dismissLoading();
//               ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
//             } else if (state is CanAddLoanRequestState) {
//               return FormBuilder(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 20.h, horizontal: 13.w),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(25.r),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 5,
//                                 blurRadius: 7,
//                                 offset: Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 25.w, vertical: 20.h),
//                             child: Column(
//                               children: [
//                                 TextFieldWidget(
//                                   labelAboveField: context.tr("loan_amount"),
//                                   keyName: "loanAmount",
//                                   controller: _loanAmountController,
//                                   validator: FormBuilderValidators.compose(
//                                     [
//                                       FormBuilderValidators.required(),
//                                       FormBuilderValidators.numeric(),
//                                     ],
//                                   ),
//                                   textInputAction: TextInputAction.next,
//                                   keyboardType: TextInputType.numberWithOptions(
//                                       decimal: false),
//                                   onChanged: (value) => loanAmountCalculatorCubit
//                                       .onLoanAmountChanged(
//                                           loanAmount: int.tryParse(value) ?? 0,
//                                           numberOfInstallments: int.tryParse(
//                                                   _numberOfInstallmentsController
//                                                       .text) ??
//                                               1),
//                                 ),
//                                 20.verticalSpace,
//                                 LoanReasonsDropMenuWidget(),
//                                 20.verticalSpace,
//                                 TextFieldWidget(
//                                   labelAboveField:
//                                       context.tr("number_of_installments"),
//                                   keyName: "numberOfInstallments",
//                                   controller: _numberOfInstallmentsController
//                                     ..text = "1",
//                                   onChanged: (value) =>
//                                       loanAmountCalculatorCubit
//                                           .onLoanAmountChanged(
//                                     loanAmount: int.tryParse(
//                                             _loanAmountController.text) ??
//                                         1,
//                                     numberOfInstallments:
//                                         int.tryParse(value) ?? 0,
//                                   ),
//                                   keyboardType: TextInputType.numberWithOptions(
//                                       decimal: false),
//                                 ),
//                                 20.verticalSpace,
//                                 BlocBuilder<LoanAmountCalculatorCubit,
//                                     LoanRequestInstallmentCalculatedState>(
//                                   builder: (context, state) {
//                                     _monthlyInstallmentController.text = state
//                                         .monthlyInstallment
//                                         .toStringAsFixed(2);
//                                     return TextFieldWidget(
//                                       labelAboveField:
//                                           context.tr("monthly_installment"),
//                                       keyName: "monthlyInstallment",
//                                       controller: _monthlyInstallmentController,
//                                       readOnly: true,
//                                     );
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       BlocBuilder<CreateLoanRequestCubit,
//                           CreateLoanRequestState>(
//                         builder: (context, state) {
//                           if (state is CreateLoanRequestLoadingState) {
//                             ViewsToolbox.showLoading();
//                           } else if (state is CreateLoanRequestErrorState) {
//                             ViewsToolbox.dismissLoading();
//                             ViewsToolbox.showErrorAwesomeSnackBar(
//                                 context, state.message!);
//                           } else if (state is CreateLoanRequestReadyState) {
//                             ViewsToolbox.dismissLoading();
//                             CustomMainRouter.push(ThankYouRoute(
//                               subtitle: context.tr(
//                                   "you_loan_request_submitted_successfully"),
//                             ));
//                           } else {
//                             return Center(
//                               child: CustomElevatedButton(
//                                 text: context.tr("submit"),
//                                 onPressed: () {
//                                   if (_formKey.currentState!
//                                       .saveAndValidate()) {
//                                     createLoanRequestCubit.createLoanRequest(
//                                         LoanRequestRequestModel(
//                                       noOfInstalments: _formKey
//                                           .currentState!
//                                           .fields["numberOfInstallments"]!
//                                           .value,
//                                       reasonRemarks: "",
//                                       applicationDate: DateFormat("dd/MM/yyyy").format(DateTime.now()),
//                                       loanAmount: _loanAmountController.text,
//                                       reason: _formKey.currentState!
//                                           .fields["purposeOfLoan"]!.value.name,
//                                     ));
//                                   }
//                                 },
//                               ),
//                             );
//                           }
//                           return Container();
//                         },
//                       ),
//                       50.verticalSpace,
//                     ],
//                   ));
//             } else if (state is CanNotAddLoanRequestState) {
//               return Center(
//                 child: AppText(
//                   text: context.tr("you_can't_add_loan_request"),
//                 ),
//               );
//             }
//             return Container();
//           },
//         ),
//       ),
//     );
//   }
// }
