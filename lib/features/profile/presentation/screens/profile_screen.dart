import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/icons.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/profile_entity.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/profile_item_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../peraonal_info/presentation/widget/EditButton.dart';
import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileCubit _profileCubit = getIt<ProfileCubit>();
  ProfileEntity? profileEntity;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("my_profile"),
      isBackEnabled: true,
      widget: Padding(
        padding:
            EdgeInsets.only(left: 15.w, right: 15.w, top: 24.h, bottom: 24.h),
        child: Column(
          children: [
            MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => _profileCubit..getProfile()),
              ],
              child: SizedBox(
                height: 281.h,
                width: 364.w,
                child: Card(
                  color: Palette.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Palette.gery_DADADA, width: 0.5),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    child: BlocConsumer<ProfileCubit, ProfileState>(
                      listener: (context, state) {
                        if (state is ProfileErrorState) {
                          ViewsToolbox.dismissLoading();
                          ViewsToolbox.showErrorAwesomeSnackBar(
                              context, state.message!);
                        }
                      },
                      builder: (context, state) {
                        if (state is ProfileLoadingState) {
                          ViewsToolbox.showLoading();
                        } else if (state is ProfileReadyState) {
                          profileEntity = state.response.data;
                          ViewsToolbox.dismissLoading();
                          return Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Assets.svg.refresh.svg(),
                                    EditButton(
                                      onPressed: () {
                                        CustomMainRouter.push(
                                            EditProfileRoute());
                                      },
                                    ),
                                  ]),
                              Container(
                                width: 60.w,
                                height: 60.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Palette.blue_5490EB,
                                    width: 4.0,
                                  ),
                                ),
                                child: Assets.svg.userCircleIcon.svg(
                                    width: 60.w,
                                    height: 60.w,
                                    color: Palette.backgroundColorDark),
                              ),
                              7.verticalSpace,
                              AppText(
                                text: profileEntity?.name ??
                                    '', //"Ahmad Riyad Abdel",
                                style: AppTextStyle.bold_16,
                              ),
                              AppText(
                                text: profileEntity?.designationName ??
                                    '', //"Project Manager",
                                style: AppTextStyle.regular_14,
                              ),
                              AppText(
                                text: profileEntity?.employeeNumber ??
                                    '', //"Employee No. 876887",
                                style: AppTextStyle.regular_14,
                              ),
                              7.verticalSpace,
                              AppText(
                                text: profileEntity?.email ??
                                    '', //"ahmed@domainname.com",
                                style: AppTextStyle.regular_14,
                                textColor: Palette.grey_525252,
                              ),
                              7.verticalSpace,
                              AppText(
                                text: profileEntity?.phone1 ??
                                    '', //"+965 54365478, +965 87654322",
                                style: AppTextStyle.regular_14,
                                textColor: Palette.grey_525252,
                              ),
                              AppText(
                                text: profileEntity?.phone2 ??
                                    '', //"+965 54365478, +965 87654322",
                                style: AppTextStyle.regular_14,
                                textColor: Palette.grey_525252,
                              ),
                              12.verticalSpace,
                              // CustomElevatedButton(
                              //   onPressed: () {},
                              //   backgroundColor: Palette.white,
                              //   borderColor: Palette.gray_B6B7B8,
                              //   showBorder: true,
                              //   customChild: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Assets.png.paci.image(),
                              //       6.horizontalSpace,
                              //       AppText(
                              //         text: context.tr("updateWithPACI"),
                              //         style: AppTextStyle.semiBold_14,
                              //         textColor: Palette.black,
                              //       ),
                              //     ],
                              //   ),
                              //   width: 197.w,
                              //   height: 40.h,
                              //   radius: 10.r,
                              // ),
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            ProfileItemWidget(
                text: context.tr("personalInfo"),
                svgIcon: personalInfoIcon,
                onTap: () {
                  CustomMainRouter.push(PersonalInfoRoute());
                }),
            // ProfileItemWidget(
            //     text: context.tr("address"),
            //     svgIcon: addressIcon,
            //     onTap: () {
            //       CustomMainRouter.push(AddressRoute());
            //     }),
            // ProfileItemWidget(
            //     text: context.tr("bankDetails"),
            //     svgIcon: bankIcon,
            //     onTap: () {}),
            ProfileItemWidget(
                text: context.tr("family"),
                svgIcon: familyIcon,
                onTap: () {
                  CustomMainRouter.push(FamilyRoute());
                }),
            ProfileItemWidget(
                text: context.tr("qualification"),
                svgIcon: qualificationIcon,
                onTap: () {
                  CustomMainRouter.push(QualificationsRoute());
                }),
            ProfileItemWidget(
                text: context.tr("workExperience"),
                svgIcon: workIcon,
                onTap: () {
                  CustomMainRouter.push(WorkRoute());
                }),
            // ProfileItemWidget(
            //     text: context.tr("uploadedDocuments"),
            //     svgIcon: documentsIcon,
            //     onTap: () {}),
          ],
        ),
      ),
    );
  }
}
