import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/tab_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/expandable_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class OperationsScreen extends StatefulWidget {
  const OperationsScreen({super.key});

  @override
  State<OperationsScreen> createState() => _OperationsScreenState();
}

class _OperationsScreenState extends State<OperationsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TabCubit _tabCubit = getIt<TabCubit>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("operations_and_statistics"),
      isBackEnabled: true,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocProvider(
            create: (context) => _tabCubit,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                                      : Palette.gery_6C6D6F),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: AppText(
                              text: context.tr("loans"),
                              style: AppTextStyle.semiBold_13,
                              textColor: Palette.blue_002A6A,
                            ))),
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
                                      : Palette.gery_6C6D6F),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: AppText(
                              text: context.tr("Grands"),
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
                                      : Palette.gery_6C6D6F),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: AppText(
                              text: context.tr("Govt. Grands"),
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
                              color: selectedIndex == 3
                                  ? Palette.yellow_FBD823
                                  : Palette.white,
                              border: Border.all(
                                  color: selectedIndex == 3
                                      ? Palette.yellow_FBD823
                                      : Palette.gery_6C6D6F),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: AppText(
                              text: context.tr("Condributions"),
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
          SizedBox(
            height: 1000.h,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                LoansWidget(),
                LoansWidget(),
                LoansWidget(),
                LoansWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoansWidget extends StatelessWidget {
  const LoansWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitleWidget(title: context.tr('loans')),
          12.verticalSpace,
          AppText(
            text: context.tr(
                'The Fund’s operations expanded in the 1990s and subsequent years to include, besides Arab, African, South Asian, and Pacific Ocean nations, countries in Central Asia, Europe, Latin America, and the Caribbean Sea, increasing the value of the Fund\'s committed loans as a result.'),
            style: AppTextStyle.medium_18,
          ),
          16.verticalSpace,
          AppText(
            text: 'Note: All Amounts are in Kuwaiti Dinar (Millions)',
            style: AppTextStyle.medium_16,
          ),
          10.verticalSpace,
          ExpandableSection(
            headerPadding: const EdgeInsetsDirectional.only(start: 20, top: 20,bottom: 20),
              customText: SizedBox(
                  width: 240.w,
                  child: MainTitleWidget(
                      title: 'Central Asian & European Countries')),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Palette.grey_7B7B7B.withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Palette.gery_DADADA),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w , vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: 'Albania',
                              style: AppTextStyle.semiBold_18,
                            ),
                            AppText(
                              text: '8 Millions',
                              style: AppTextStyle.regular_18,
                            ),
                          ],
                        ),
                        Divider(
                          color: Palette.gery_DADADA,
                          thickness: 1,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: 'Agriculture ',
                                  style: AppTextStyle.semiBold_16,
                                ),
                                AppText(
                                  text: '3 Millions',
                                  style: AppTextStyle.regular_16,
                                ),
                                AppText(
                                  text: '39,587 KD',
                                  style: AppTextStyle.regular_16,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                12.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Palette.grey_7B7B7B.withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Palette.gery_DADADA),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w , vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: 'Albania',
                              style: AppTextStyle.semiBold_18,
                            ),
                            AppText(
                              text: '8 Millions',
                              style: AppTextStyle.regular_18,
                            ),
                          ],
                        ),
                        Divider(
                          color: Palette.gery_DADADA,
                          thickness: 1,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: 'Agriculture ',
                                  style: AppTextStyle.semiBold_16,
                                ),
                                AppText(
                                  text: '3 Millions',
                                  style: AppTextStyle.regular_16,
                                ),
                                AppText(
                                  text: '39,587 KD',
                                  style: AppTextStyle.regular_16,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
          12.verticalSpace,
          ExpandableSection(
            headerPadding: const EdgeInsetsDirectional.only(start: 20, top: 20,bottom: 20),
              customText: SizedBox(
                  width: 240.w,
                  child: MainTitleWidget(
                      title: 'Central Asian & European Countries')),
              children: []),
          12.verticalSpace,
          ExpandableSection(
            headerPadding: const EdgeInsetsDirectional.only(start: 20, top: 20,bottom: 20),
              customText: SizedBox(
                  width: 240.w,
                  child: MainTitleWidget(
                      title: 'Central Asian & European Countries')),
              children: [
              ]),
        ],
      ),
    );
  }
}
