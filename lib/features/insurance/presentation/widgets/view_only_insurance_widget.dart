import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/entities/insurance_entity.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/insurance_cubit.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/insurance_member_cubit/insurance_member_cubit.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/widgets/insurance_program_dropmenu_widget.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/widgets/subscriber_item_card.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';

class ViewOnlyInsuranceWidget extends StatelessWidget {
  final InsuranceEntity insuranceEntity;
  final bool showCancelButtom;

  final InsuranceMemberCubit beneficiaryCubit = getIt<InsuranceMemberCubit>();
  final InsuranceCubit insuranceCubit;
  ViewOnlyInsuranceWidget(
      {super.key,
      required this.insuranceEntity,
      required this.showCancelButtom,
      required this.insuranceCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => beneficiaryCubit..getSubscribers(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
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
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                child: Column(
                  children: [
                    if (insuranceEntity.insurenceStatus != null &&
                        insuranceEntity.insurenceStatus != "null" &&
                        insuranceEntity.insurenceStatus != "")
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: Palette.blue_5490EB,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: Palette.blue_5490EB,
                            ),
                            10.horizontalSpace,
                            Flexible(
                              child: AppText(
                                maxLines: 3,
                                text: insuranceEntity.insurenceStatus,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    20.verticalSpace,
                    TextFieldWidget(
                      keyName: "empolyeeName",
                      labelAboveField: context.tr("employee_name"),
                      initalValue: insuranceEntity.employeeName,
                      readOnly: true,
                    ),
                    20.verticalSpace,
                    TextFieldWidget(
                      keyName: "companyName",
                      labelAboveField: context.tr("company_name"),
                      initalValue: insuranceEntity.insuranceCompanyName
                          ?.replaceAll("null", ""),
                      readOnly: true,
                    ),
                    20.verticalSpace,
                    TextFieldWidget(
                      keyName: "startDate",
                      labelAboveField: context.tr("start_date"),
                      initalValue:
                          insuranceEntity.startDate?.replaceAll("null", ""),
                      readOnly: true,
                    ),
                    20.verticalSpace,
                    InsuranceProgramDropmenu(
                      initalValue: insuranceEntity.programSubscribed,
                      isReadOnly: true,
                    ),
                    20.verticalSpace,
                    TextFieldWidget(
                      keyName: "lifeInsuranceBeneficiaries",
                      labelAboveField:
                          context.tr("life_insurance_beneficiaries"),
                      initalValue:
                          insuranceEntity.noOfPersons?.replaceAll("null", ""),
                      readOnly: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<InsuranceMemberCubit, InsuranceMemberState>(
            builder: (context, state) {
              if (state is SubscriberReadyState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTitleWidget(title: context.tr("beneficiaries")),
                    SubscriberItemCard(
                      subscriberList: state.subscriberList,
                      onSelect: (index) {},
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
          20.verticalSpace,
          if (showCancelButtom)
            CustomElevatedButton(
              radius: 10.r,
              width: 1.sw,
              onPressed: () {
                insuranceCubit.unsubscribeInsurance();
              },
              text: context.tr("unsubscribe_insurance"),
              backgroundColor: Palette.red_FF0606,
            ),
          50.verticalSpace,
        ],
      ),
    );
  }
}
