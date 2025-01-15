import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/beneficiary_cubit/beneficiary_cubit.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/create_insurance_request_cubit/create_insurance_request_cubit.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/insurance_cubit.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/widgets/add_beneficiary_Item_widget.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/widgets/beneficiary_item_card.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/widgets/insurance_program_dropmenu_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class CreateInsuranceRequestScreen extends StatefulWidget {
  const CreateInsuranceRequestScreen({super.key});

  @override
  State<CreateInsuranceRequestScreen> createState() =>
      _CreateInsuranceRequestScreenState();
}

class _CreateInsuranceRequestScreenState
    extends State<CreateInsuranceRequestScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final InsuranceCubit insuranceCubit = getIt<InsuranceCubit>();
  final CreateInsuranceRequestCubit createInsuranceRequestCubit =
      getIt<CreateInsuranceRequestCubit>();

  final BeneficiaryCubit beneficiaryCubit = getIt<BeneficiaryCubit>();
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      isBackEnabled: true,
      screenTitle: context.tr("add_insurance"),
      widget: MultiBlocProvider(
        providers: [
          BlocProvider<CreateInsuranceRequestCubit>(
            create: (context) => createInsuranceRequestCubit,
          ),
          BlocProvider<InsuranceCubit>(
            create: (context) => insuranceCubit..getInsurancePrograms(),
          ),
          BlocProvider(create: (context) => beneficiaryCubit),
        ],
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
                          CustomDropDownField<String>(
                            keyName: "insuranceCompany",
                            labelText: context.tr("insurance_company"),
                            disableSearch: true,
                            disableFiled: false,
                            labelAboveField: context.tr("insurance_company"),
                            onChanged: (
                              String? newSelectedService,
                            ) {},
                            items: <String>[
                              'Kuwait Insurance Company',
                              'company 2',
                            ].map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: AppText(
                                  text: item,
                                  style: AppTextStyle.medium_18,
                                ),
                              );
                            }).toList(),
                            itemsSearchable: <String>[
                              'Kuwait Insurance Company',
                              'company 2',
                            ]
                                .map(
                                  (String item) => <String, String>{
                                    item: item,
                                  },
                                )
                                .toList(),
                            validator: (String? value) =>
                                AppValidator.validatorRequired(
                              value,
                              context,
                            ),
                          ),
                          20.verticalSpace,
                          CustomSingleRangeDatePicker(
                            validator: (String? value) =>
                                AppValidator.validatorRequired(
                              value,
                              context,
                            ),
                            fromLabelAboveField:
                                context.tr("suscription_start_date"),
                            customFormKey: _formKey,
                            keyNameFrom: "startDate",
                          ),
                          20.verticalSpace,
                          InsuranceProgramDropmenu(),
                        ],
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: MainTitleWidget(title: context.tr("beneficiaries")),
                ),
                AddBeneficiaryItem(beneficiaryCubit),
                BlocBuilder<BeneficiaryCubit, BeneficiaryState>(
                  builder: (context, state) {
                    if (state is BeneficiaryAddedState) {
                      return BeneficiaryItemCard(
                        beneficiaries: state.beneficiaryList,
                        onDelete: (index) {
                          beneficiaryCubit.removeBeneficiary(index);
                        },
                      );
                    }
                    return Container();
                  },
                ),
                BlocBuilder<CreateInsuranceRequestCubit,
                    CreateInsuranceRequestState>(
                  builder: (context, state) {
                    if (state is CreateInsuranceRequestReadyState) {
                      ViewsToolbox.dismissLoading();
                      CustomMainRouter.push(ThankYouRoute(
                        title: context.tr("request_submitted_successfully"),
                        subtitle: context
                            .tr("you_insurance_request_submitted_successfully"),
                      ));
                    } else if (state is CreateInsuranceRequestLoadingState) {
                      ViewsToolbox.showLoading();
                    } else if (state is CreateInsuranceRequestErrorState) {
                      ViewsToolbox.dismissLoading();

                      ViewsToolbox.showErrorAwesomeSnackBar(
                          context, state.message!);
                    }
                    return Center(
                        child: CustomElevatedButton(
                      text: context.tr("submit"),
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          createInsuranceRequestCubit.createInsuranceRequest();
                          // print(_formKey.currentState!.value);
                          // CustomMainRouter.push(ThankYouRoute(
                          //   subtitle: context.tr(
                          //       "you_insurance_request_submitted_successfully"),
                          // ));
                        }
                      },
                    ));
                  },
                ),
                50.verticalSpace,
              ],
            )),
      ),
    );
  }
}
