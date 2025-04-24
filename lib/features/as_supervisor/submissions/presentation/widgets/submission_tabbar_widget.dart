import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/cubits/submission_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/cubit/tab_cubit/tab_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class SubmissionTabbarWidget extends StatelessWidget {
  const SubmissionTabbarWidget({
    super.key,
    required TabCubit tabCubit,
    required TabController tabController,
    required this.submissionsCubit,
  })  : _tabCubit = tabCubit,
        _tabController = tabController;

  final TabCubit _tabCubit;
  final TabController _tabController;
  final SubmissionCubit submissionsCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _tabCubit,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child:
            BlocBuilder<TabCubit, int>(builder: (context, int selectedIndex) {
          return TabBar(
            padding: EdgeInsets.zero,
            //  indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsetsDirectional.only(end: 10.w),
            indicatorColor: Colors.transparent,
            onTap: (value) {
              _tabCubit.changeTab(value);
              submissionsCubit.getSubmissions();
            },
            //      padding: EdgeInsets.zero,
            //      indicatorWeight: double.minPositive,
            //     indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            isScrollable: true,
            // indicator: BoxDecoration(
            //   color: Palette.yellow_FBD823,
            //   border: Border.all(color: Palette.gery_6C6D6F),
            //   borderRadius: BorderRadius.circular(10),
            // ),
            tabs: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 70.w, minHeight: 37.h),
                child: Container(
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
                    child: Center(child: AppText(text: context.tr("all")))),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 70.w, minHeight: 37.h),
                child: Container(
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
                    child: Center(child: AppText(text: context.tr("leave")))),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100.w, minHeight: 37.h),
                child: Container(
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
                        child: AppText(text: context.tr("certificate")))),
              ),
              // ConstrainedBox(
              //   constraints: BoxConstraints(minWidth: 100.w, minHeight: 37.h),
              //   child: Container(
              //       decoration: BoxDecoration(
              //         color: selectedIndex == 3
              //             ? Palette.yellow_FBD823
              //             : Palette.white,
              //         border: Border.all(
              //             color: selectedIndex == 3
              //                 ? Palette.yellow_FBD823
              //                 : Palette.gery_DADADA),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child:
              //           Center(child: AppText(text: context.tr("training")))),
              // ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100.w, minHeight: 37.h),
                child: Container(
                    decoration: BoxDecoration(
                      color: selectedIndex == 4
                          ? Palette.yellow_FBD823
                          : Palette.white,
                      border: Border.all(
                          color: selectedIndex == 4
                              ? Palette.yellow_FBD823
                              : Palette.gery_DADADA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                        Center(child: AppText(text: context.tr("insurance")))),
              ),
            ],
          );
        }),
      ),
    );
  }
}
