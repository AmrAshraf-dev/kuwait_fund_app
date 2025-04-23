import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/peraonal_info/domain/entities/personal_info_entity.dart';
import 'package:kf_ess_mobile_app/features/peraonal_info/presentation/cubits/personal_info_cubit.dart';
import 'package:kf_ess_mobile_app/features/peraonal_info/presentation/widget/EditButton.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  final PersonalInfoCubit _personalInfoCubit = getIt<PersonalInfoCubit>();
  PersonalInfoEntity? personalInfoEntity;
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("personalInfo"),
      isBackEnabled: true,
      widget: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => _personalInfoCubit..getPersonalInfo()),
        ],
        child: Padding(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, top: 14.h, bottom: 24.h),
          child: BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
              listener: (context, state) {
            if (state is PersonalInfoErrorState) {
              ViewsToolbox.dismissLoading();
              ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
            }
          }, builder: (context, state) {
            if (state is PersonalInfoLoadingState) {
              ViewsToolbox.showLoading();
            } else if (state is PersonalInfoReadyState) {
              ViewsToolbox.dismissLoading();
              personalInfoEntity = state.response.data;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Assets.svg.refresh.svg(),
                        CustomElevatedButton(
                          onPressed: () {},
                          backgroundColor: Palette.white,
                          borderColor: Palette.gray_B6B7B8,
                          showBorder: true,
                          customChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.png.paci.image(),
                              6.horizontalSpace,
                              AppText(
                                text: context.tr("updateWithPACI"),
                                style: AppTextStyle.semiBold_14,
                                textColor: Palette.black,
                              ),
                            ],
                          ),
                          width: 197.w,
                          height: 40.h,
                          radius: 10.r,
                        ),
                      ]),
                  25.verticalSpace,
                  MainTitleWidget(title: context.tr("employee_details")),
                  12.verticalSpace,
                  Card(
                    margin: EdgeInsets.zero,
                    color: Palette.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Palette.gery_DADADA, width: 0.5),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 13.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Align(
                          //   alignment: AlignmentDirectional.topEnd,
                          //   child: EditButton(
                          //     onPressed: () {
                          //       CustomMainRouter.push(EditProfileRoute());
                          //     },
                          //   ),
                          // ),
                          PersonalInfoItem(
                              title: context.tr("employeeNumber"),
                              body: personalInfoEntity?.employeeNumber ??
                                  '' //"876887"
                              ),
                          PersonalInfoItem(
                              title: context.tr("fullName"),
                              body: personalInfoEntity?.name ??
                                  '' //"Ahmad Riyad Abdel"
                              ),
                          PersonalInfoItem(
                              title: context.tr("civil_id"),
                              body:
                                  personalInfoEntity?.civilID ?? '' //"TE987345"
                              ),
                          PersonalInfoItem(
                              title: context.tr("residencyExpiryDate"),
                              body: personalInfoEntity?.recidancyExpiryDate ??
                                  '' //"12/3/2030"
                              ),
                          PersonalInfoItem(
                              title: context.tr("nationaliy"),
                              body: personalInfoEntity?.nationalityName ??
                                  '' //"Jordan"
                              ),
                          PersonalInfoItem(
                              title: context.tr("passportNo"),
                              body: "TE987345"),
                          PersonalInfoItem(
                              title: context.tr("passportExpiryDate"),
                              body: personalInfoEntity?.passportExpiryDate ??
                                  '' //"12/3/2030"
                              ),
                          PersonalInfoItem(
                              title: context.tr("email"),
                              body: personalInfoEntity?.email ??
                                  '' //"ahmed@domainname.com"
                              ),
                          PersonalInfoItem(
                              title: context.tr("phone"),
                              body: personalInfoEntity?.phone1 ??
                                  '', //"+965 54365478, +965 87654322",
                              withDivider: false),
                        ],
                      ),
                    ),
                  ),
                  25.verticalSpace,
                  MainTitleWidget(title: context.tr("contractDetails")),
                  12.verticalSpace,
                  SizedBox(
                    width: 1.sw,
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: Palette.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side:
                            BorderSide(color: Palette.gery_DADADA, width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 13.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PersonalInfoItem(
                                title: context.tr("contractType"),
                                body: personalInfoEntity?.contractTypeName ??
                                    '', //"Work",
                                withDivider: false),
                            8.verticalSpace,
                            PersonalInfoItem(
                                title: context.tr("jobTitle"),
                                body: personalInfoEntity?.designationName ??
                                    '', //"Project Manager",
                                withDivider: false),
                            8.verticalSpace,
                            PersonalInfoItem(
                                title: context.tr("contractStartDate"),
                                body: personalInfoEntity?.contactStartDate ??
                                    '', //"12/3/2022",
                                withDivider: false),
                            8.verticalSpace,
                            PersonalInfoItem(
                                title: context.tr("contractEndDate"),
                                body: personalInfoEntity?.contactEndDate ??
                                    '', //"12/3/2030",
                                withDivider: false),
                            8.verticalSpace,
                            PersonalInfoItem(
                                title: context.tr("joiningDate"),
                                body: personalInfoEntity?.joiningDate ??
                                    '', //"12/3/2030",
                                withDivider: false),
                          ],
                        ),
                      ),
                    ),
                  ),
                  60.verticalSpace
                ],
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}

class PersonalInfoItem extends StatelessWidget {
  const PersonalInfoItem(
      {super.key,
      required this.title,
      required this.body,
      this.withDivider = true});

  final String title;
  final String body;
  final bool? withDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
          text: title,
          style: AppTextStyle.regular_14,
        ),
        6.verticalSpace,
        AppText(
          text: body,
          style: AppTextStyle.bold_16,
        ),
        if (withDivider ?? true)
          Divider(
            color: Palette.grey_E5DEDE,
            thickness: 1,
          ),
      ],
    );
  }
}
