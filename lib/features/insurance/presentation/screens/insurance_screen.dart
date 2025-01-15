import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/insurance_cubit.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/widgets/insurance_row_details_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class InsuranceScreen extends StatefulWidget {
  const InsuranceScreen({super.key});

  @override
  State<InsuranceScreen> createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  final InsuranceCubit insuranceCubit = getIt<InsuranceCubit>();

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("insurance"),
      appBarHeight: 90.h,
      widget: BlocProvider(
        create: (context) => insuranceCubit..getInsuranceDetails(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
          child: BlocBuilder<InsuranceCubit, InsuranceState>(
            builder: (context, state) {
              if (state is InsuranceLoadingState) {
                ViewsToolbox.showLoading();
              } else if (state is InsuranceDetailsReadyState) {
                ViewsToolbox.dismissLoading();

                final insurance = state.response.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          30.verticalSpace,
                          InsuranceRowDetails(
                            title: insurance?.insuranceCompanyName ?? "",
                            subtitle:
                                "${context.tr("insurance_id")} ${insurance?.insuranceCompany}",
                            status: insurance?.statusLabel,
                          ),
                          Divider(thickness: 1),
                          InsuranceRowDetails(
                            title: context.tr("insurance_holder_name"),
                            subtitle: insurance?.employeeName ?? "",
                          ),
                          Divider(thickness: 1),
                          InsuranceRowDetails(
                            title: context.tr("insurance_company"),
                            subtitle: insurance?.insuranceCompanyName ?? "",
                          ),
                          Divider(thickness: 1),
                          InsuranceRowDetails(
                            title: context.tr("insurance_period"),
                            subtitle: insurance?.startDate ?? "",
                          ),
                          Divider(thickness: 1),
                          InsuranceRowDetails(
                            title: context.tr("plan"),
                            subtitle: insurance?.programSubscribed ?? "",
                          ),
                          Divider(thickness: 1),
                          InsuranceRowDetails(
                            title: context.tr("number_of_benficiaries"),
                            subtitle: insurance?.noOfPersons ?? "",
                          ),
                          30.verticalSpace,
                        ],
                      ),
                    ),
                    12.verticalSpace,
                    MainTitleWidget(title: context.tr("beneficiaries")),
                    8.verticalSpace,
                    // Add beneficiaries list here if available
                    29.verticalSpace,
                    CustomElevatedButton(
                      radius: 10.r,
                      width: 1.sw,
                      onPressed: () {
                        insuranceCubit.unsubscribeInsurance();
                      },
                      text: context.tr("unsubscribe_insurance"),
                      backgroundColor: Palette.red_FF0606,
                    ),
                  ],
                );
              } else if (state is InsuranceErrorState) {
                return Center(
                    child: Text(state.message ?? context.tr("error_occurred")));
              } else if (state is InsuranceUnsubscribedState) {
                ViewsToolbox.dismissLoading();
                return Center(
                    child: Text(context.tr("unsubscribed_successfully")));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
