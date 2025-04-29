import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/about/presentation/cubits/general_information_cubit/general_information_cubit.dart';
import 'package:kf_ess_mobile_app/features/about/presentation/cubits/kf_board_of_directors_cubit/kf_board_of_directors_cubit.dart';
import 'package:kf_ess_mobile_app/features/about/presentation/cubits/kf_managment_cubit/kf_managment_cubit.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/fund_profile_item.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/profile_item_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/cubit/tab_cubit/tab_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TabCubit _tabCubit = getIt<TabCubit>();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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
                              textColor: selectedIndex == 0? Palette.white:
                              
                              Palette.blue_002A6A,
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
                              text: context.tr("fundManagement"),
                              style: AppTextStyle.semiBold_13,
                              textColor: selectedIndex == 1? Palette.white:
                              Palette.blue_002A6A,
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
                              textColor: selectedIndex == 2? Palette.white:
                              
                              Palette.blue_002A6A,
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
                GeneralInformationTab(),
                FundManagementTab(),
                FundDirectorsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GeneralInformationTab extends StatelessWidget {
  final GeneralInformationCubit _generalInformationCubit =
      getIt<GeneralInformationCubit>();
  GeneralInformationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _generalInformationCubit,
      child: BlocConsumer<GeneralInformationCubit, GeneralInformationState>(
        listener: (context, state) {
            if (state is GeneralInformationErrorState) {
            ViewsToolbox.dismissLoading();
            ViewsToolbox.showErrorAwesomeSnackBar(context, context.tr(state.message!));
          }
        },
        builder: (context, state) {
          if (state is GeneralInformationLoadingState) {
            ViewsToolbox.showLoading();
          }  else if (state is GeneralInformationReadyState) {
            ViewsToolbox.dismissLoading();

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ProfileItemWidget(
                        withIcon: false,
                        text: context.tr(state.response.data![index].title!),
                        onTap: () {
                          CustomMainRouter.push(AboutItemDetailsRoute(
                              details: state.response.data![index].description!,
                              title: context
                                  .tr(state.response.data![index].title!)));
                        },
                      ),
                  itemCount: state.response.data?.length ?? 0),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class FundManagementTab extends StatelessWidget {
  FundManagementTab({super.key});

  final KFManagmentCubit _kfManagmentCubit = getIt<KFManagmentCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _kfManagmentCubit,
      child: BlocBuilder<KFManagmentCubit, KFManagmentState>(
        builder: (context, state) {
          if (state is KFManagmentLoadingState) {
            ViewsToolbox.showLoading();
          } else if (state is KFManagmentErrorState) {
            ViewsToolbox.dismissLoading();
            ViewsToolbox.showErrorAwesomeSnackBar(context, context.tr(state.message!));
          } else if (state is KFManagmentReadyState) {
            ViewsToolbox.dismissLoading();

            return RefreshIndicator(
              onRefresh: () async {
                _kfManagmentCubit.getKFManagment();
              },
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                   // childAspectRatio: 1.0
                    ),
                itemCount: state.response.data?.length ?? 0,
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                itemBuilder: (context, index) {
                  return FundProfileItem(
                    name: state.response.data![index].name!,
                    role: state.response.data![index].role!,
                    imageUrl: state.response.data![index].imageUrl!,
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class FundDirectorsTab extends StatelessWidget {
  FundDirectorsTab({super.key});

  final KFBoardOfDirectorsCubit _kfBoardOfDirectorsCubit =
      getIt<KFBoardOfDirectorsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _kfBoardOfDirectorsCubit,
        child: BlocBuilder<KFBoardOfDirectorsCubit, KFBoardOfDirectorsState>(
            builder: (context, state) {
          if (state is KFBoardOfDirectorsLoadingState) {
            ViewsToolbox.showLoading();
          } else if (state is KFBoardOfDirectorsErrorState) {
            ViewsToolbox.dismissLoading();
            ViewsToolbox.showErrorAwesomeSnackBar(context, context.tr(state.message!));
          } else if (state is KFBoardOfDirectorsReadyState) {
            ViewsToolbox.dismissLoading();

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: RefreshIndicator(
                onRefresh: () async {
                  _kfBoardOfDirectorsCubit.getKFBoardOfDirectors();
                },
                child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: state.response.data![index].name!,
                                style: AppTextStyle.medium_18,
                              ),
                              8.verticalSpace,
                              AppText(
                                maxLines: 2,
                                text: state.response.data![index].role!,
                                style: AppTextStyle.medium_14,
                                textColor: Palette.grey_707070,
                              ),
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider(
                          color: Palette.black,
                          height: 2,
                        ),
                    itemCount: 8),
              ),
            );
          }
          return Container();
        }));
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
