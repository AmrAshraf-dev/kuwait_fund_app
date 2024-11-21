import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/fund_profile_item.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/profile_item_widget.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/tab_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() =>
      _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> with TickerProviderStateMixin {

  late TabController _tabController;
  final TabCubit _tabCubit = getIt<TabCubit>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<String> fundManagementTitles = [
    'fundGoal',
    'typesOfFundActivities',
    'scopeOfFundOperations',
    'beneficiaries',
    'typesOfAid',
  ];
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        screenTitle: context.tr("about_kuwait_fund"),
        isBackEnabled: true,
        hasScroll: false,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocProvider(
              create: (context) => _tabCubit,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: BlocBuilder<TabCubit, int>(
                    builder: (context, int selectedIndex) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: TabBar(
                          padding: EdgeInsets.zero,
                          labelPadding: EdgeInsetsDirectional.only(end: 10.w),
                          indicatorColor: Colors.transparent,
                          onTap: (value) {
                            _tabCubit.changeTab(value);
                          },
                          controller: _tabController,
                          isScrollable: true,
                          tabs: <Widget>[
                            ConstrainedBox(
                              constraints:
                              BoxConstraints(minWidth: 70.w, minHeight: 37.h),
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == 0
                                        ? Palette.yellow_FBD823
                                        : Palette.white,
                                    border: Border.all(
                                        color: selectedIndex == 0
                                            ? Palette.yellow_FBD823
                                            : Palette.gery_DADADA),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: AppText(
                                        text: context.tr("general_information"),
                                        style: AppTextStyle.semiBold_13,
                                        textColor: Palette.blue_002A6A,
                                      )
                                  )),
                            ),
                            ConstrainedBox(
                              constraints:
                              BoxConstraints(minWidth: 70.w, minHeight: 37.h),
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == 1
                                        ? Palette.yellow_FBD823
                                        : Palette.white,
                                    border: Border.all(
                                        color: selectedIndex == 1
                                            ? Palette.yellow_FBD823
                                            : Palette.gery_DADADA),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: AppText(
                                        text: context.tr("fundManagement"),
                                        style: AppTextStyle.semiBold_13,
                                        textColor: Palette.blue_002A6A,
                                      ))),
                            ),
                            ConstrainedBox(
                              constraints:
                              BoxConstraints(minWidth: 100.w, minHeight: 37.h),
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == 2
                                        ? Palette.yellow_FBD823
                                        : Palette.white,
                                    border: Border.all(
                                        color: selectedIndex == 2
                                            ? Palette.yellow_FBD823
                                            : Palette.gery_DADADA),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: AppText(
                                        text: context.tr("fundBoardOfDirectors"),
                                        style: AppTextStyle.semiBold_13,
                                        textColor: Palette.blue_002A6A,
                                      ))),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            10.verticalSpace,
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  GeneralInformationWidget(data: fundManagementTitles),
                  FundManagementWidget(),
                  FundDirectorsWidget(),
                ],
              ),
            ),
          ],
        ),
    );
  }
}

class GeneralInformationWidget extends StatelessWidget {
  const GeneralInformationWidget({super.key , required this.data});

  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: ListView.builder(
        shrinkWrap: true,
          itemBuilder: (context, index) => ProfileItemWidget(
              withIcon: false,
              text: context.tr(data[index]),
              onTap: () {},
          ),
          itemCount: 5
      ),
    );
  }
}

class FundManagementWidget extends StatelessWidget {
  const FundManagementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisExtent: 250,
      crossAxisSpacing: 10.w,
      mainAxisSpacing: 10.h,
    ),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      children: [
        FundProfileItem(),
        FundProfileItem(),
        FundProfileItem(),
        FundProfileItem(),
        FundProfileItem(),
        FundProfileItem(),
        FundProfileItem(),
      ],
    );
  }
}

class FundDirectorsWidget extends StatelessWidget {
  const FundDirectorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: 'Hesham El Nemr', style: AppTextStyle.medium_18,),
                8.verticalSpace,
                AppText(text: 'Software eng , Flutter developer', style: AppTextStyle.medium_10,
                  textColor: Palette.grey_707070,),
              ],
            ),
          ),
          separatorBuilder: (context, index) => Divider(
            color: Palette.black,
            height: 2,
          ),
          itemCount: 8
      ),
    );
  }
}

/// Old Design
// Padding(
//   padding: EdgeInsets.symmetric(horizontal: 18.w , vertical: 25.h),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       MainTitleWidget(
//           title: context.tr('about_title1')
//       ),
//       12.verticalSpace,
//       AppText(
//         text: context.tr('about_body1'),
//         style: AppTextStyle.medium_18,
//       ),
//       25.verticalSpace,
//       MainTitleWidget(
//         title: context.tr('about_title2'),
//       ),
//       12.verticalSpace,
//       AppText(
//         text: context.tr('about_body2'),
//         style: AppTextStyle.medium_18,
//       ),
//       25.verticalSpace,
//       MainTitleWidget(
//         title: context.tr('about_title3'),
//       ),
//       12.verticalSpace,
//       AppText(
//         text: context.tr('about_body3'),
//         style: AppTextStyle.medium_18,
//       ),
//     ],
//   ),
// ),
