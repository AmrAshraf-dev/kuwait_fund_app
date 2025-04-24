// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
// import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
// import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
// import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
// import 'package:kf_ess_mobile_app/features/insurance/data/models/request/create_insurance_request_model.dart';
// import 'package:kf_ess_mobile_app/features/insurance/domain/entities/insurance_entity.dart';
// import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/create_insurance_request_cubit/create_insurance_request_cubit.dart';
// import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/insurance_member_cubit/insurance_member_cubit.dart';
// import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/selected_family_members_cubit/selected_family_members_cubit.dart';
// import 'package:kf_ess_mobile_app/features/insurance/presentation/widgets/family_member_item_card.dart';
// import 'package:kf_ess_mobile_app/features/insurance/presentation/widgets/insurance_program_dropmenu_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
// import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';

// class CreateInsuranceRequestWidget extends StatelessWidget {
//   final InsuranceEntity insuranceEntity;
//   CreateInsuranceRequestWidget({super.key, required this.insuranceEntity});

//   final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

//   final CreateInsuranceRequestCubit createInsuranceRequestCubit =
//       getIt<CreateInsuranceRequestCubit>();

//   final InsuranceMemberCubit insuranceMemberCubit =
//       getIt<InsuranceMemberCubit>();

//   final SelectedFamilyMembersCubit selectedFamilyMembersCubit =
//       getIt<SelectedFamilyMembersCubit>();
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<CreateInsuranceRequestCubit>(
//           create: (context) => createInsuranceRequestCubit,
//         ),
//         BlocProvider(
//             create: (context) => insuranceMemberCubit..getFamilyMembers()),
//         BlocProvider(create: (context) => selectedFamilyMembersCubit),
//       ],
//       child: FormBuilder(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(25.r),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
//                     child: Column(
//                       children: [
//                         TextFieldWidget(
//                           keyName: "empolyeeName",
//                           labelAboveField: context.tr("employee_name"),
//                           initalValue: insuranceEntity.employeeName,
//                           readOnly: true,
//                         ),
//                         20.verticalSpace,
//                         TextFieldWidget(
//                           keyName: "companyName",
//                           labelAboveField: context.tr("company_name"),
//                           initalValue: insuranceEntity.insuranceCompanyName
//                               ?.replaceAll("null", ""),
//                         ),
//                         20.verticalSpace,
//                         TextFieldWidget(
//                           keyName: "startDate",
//                           labelAboveField: context.tr("start_date"),
//                           initalValue:
//                               insuranceEntity.startDate?.replaceAll("null", ""),
//                           readOnly: true,
//                         ),
//                         // CustomSingleRangeDatePicker(
//                         //   validator: (String? value) =>
//                         //       AppValidator.validatorRequired(
//                         //     value,
//                         //     context,
//                         //   ),
//                         //   fromLabelAboveField:
//                         //       context.tr("suscription_start_date"),
//                         //   customFormKey: _formKey,
//                         //   keyNameFrom: "startDate",
//                         // ),
//                         20.verticalSpace,
//                         TextFieldWidget(
//                           keyName: "lifeInsuranceBeneficiaries",
//                           labelAboveField:
//                               context.tr("life_insurance_beneficiaries"),
//                         ),
//                         20.verticalSpace,
//                         InsuranceProgramDropmenu(
//                           initalValue: insuranceEntity.programSubscribed,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 child: MainTitleWidget(title: context.tr("beneficiaries")),
//               ),
//               //AddBeneficiaryItem(beneficiaryCubit),
//               BlocBuilder<InsuranceMemberCubit, InsuranceMemberState>(
//                 builder: (context, state) {
//                   if (state is InsuranceMemberReadyState) {
//                     return FamilyMemberItemCard(
//                       familyMemberList: state.familyMemberList,
//                       selectedFamilyMembersCubit: selectedFamilyMembersCubit,
//                     );
//                   }
//                   return Container();
//                 },
//               ),
//               20.verticalSpace,

//               BlocBuilder<CreateInsuranceRequestCubit,
//                   CreateInsuranceRequestState>(
//                 builder: (context, state) {
//                   if (state is CreateInsuranceRequestReadyState) {
//                     ViewsToolbox.dismissLoading();
//                     CustomMainRouter.push(ThankYouRoute(
//                       title: context.tr("request_submitted_successfully"),
//                       subtitle: context
//                           .tr("you_insurance_request_submitted_successfully"),
//                     ));
//                   } else if (state is CreateInsuranceRequestLoadingState) {
//                     ViewsToolbox.showLoading();
//                   } else if (state is CreateInsuranceRequestErrorState) {
//                     ViewsToolbox.dismissLoading();

//                     ViewsToolbox.showErrorAwesomeSnackBar(
//                         context, state.message!);
//                   }
//                   return Center(
//                       child: CustomElevatedButton(
//                     text: context.tr("submit"),
//                     onPressed: () {
//                       if (_formKey.currentState!.saveAndValidate()) {
//                         createInsuranceRequestCubit
//                             .createInsuranceRequest(CreateInsuranceRequestModel(
//                           familyMembers:
//                               selectedFamilyMembersCubit.selectedFamilyMembers,
//                           beneficiaries: _formKey.currentState!
//                               .fields["lifeInsuranceBeneficiaries"]!.value
//                               .toString(),
//                           programSubscribedId: _formKey.currentState!
//                               .fields["insuranceProgram"]!.value.id
//                               .toString(),
//                           startDate: _formKey
//                               .currentState!.fields["startDate"]!.value
//                               .toString(),
//                           insuranceCompanyID:
//                               insuranceEntity.insuranceCompanyID,
//                         ));
//                       }
//                     },
//                   ));
//                 },
//               ),
//               50.verticalSpace,
//             ],
//           )),
//     );
//   }
// }
