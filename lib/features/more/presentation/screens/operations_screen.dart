import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/more/presentation/widgets/loan_item_widget.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/tab_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
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
      hasScroll: false,
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
                                      : Palette.gery_DADADA),
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
                                      : Palette.gery_DADADA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: AppText(
                              text: context.tr("grands"),
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
                              text: context.tr("govt_grands"),
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
                                      : Palette.gery_DADADA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: AppText(
                              text: context.tr("condributions"),
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
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                OperationsLoanItemWidget(),
                OperationsLoanItemWidget(),
                OperationsLoanItemWidget(),
                OperationsLoanItemWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
