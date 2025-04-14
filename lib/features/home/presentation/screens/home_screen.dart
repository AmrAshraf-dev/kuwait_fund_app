import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kf_ess_mobile_app/core/constants/icons.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/helper/general_helper.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/cubits/home_cubit.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/create_request_section_widget.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/half_circle_chart_widget.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/recent_update_section_widget.dart';
import 'package:kf_ess_mobile_app/features/home/presentation/screens/widgets/slider_section_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/data/local_data.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeCubit homeCubit = getIt<HomeCubit>();
  @override
  void initState() {
    print('TOKEN : ${LocalData.getUser()?.tokenInfo.token ?? ''}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit..getLeaveDashboard(),
      child: MasterWidget(
          waterMarkImage: waterMarkImage3,
          appBarHeight: 260.h,
          appBarBody: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // profile photo image widget
                      Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Palette.blue_5490EB,
                            width: 2.0,
                          ),
                        ),
                        child: ViewsToolbox.getImageWidget(
                          imageUrl: LocalData.getUser()?.userInfo.photoURL,
                        ),
                      ),
                      12.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text:
                                "${context.tr('hi')} ${GeneralHelper.getWelcomeMessage(context)}",
                            style: AppTextStyle.regular_16,
                            textColor: Colors.white,
                          ),
                          5.verticalSpace,
                          SizedBox(
                            width: 150.w,
                            child: AppText(
                              text: LocalData.getUser()?.userInfo.name,
                              style: AppTextStyle.bold_16,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          height: 38.h,
                          width: 38.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(chatbot),
                          )),
                      17.horizontalSpace,
                      InkWell(
                        onTap: () =>
                            CustomMainRouter.push(NotificationsRoute()),
                        child: Badge(
                          padding: EdgeInsets.all(1),
                          backgroundColor: Palette.red_FF0606,
                          label: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Center(
                              child: AppText(
                                text: '3',
                                style: AppTextStyle.bold_12,
                                textColor: Colors.white,
                              ),
                            ),
                          ),
                          child: Container(
                              height: 38.h,
                              width: 38.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SvgPicture.asset(notification),
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              20.verticalSpace,
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is HomeLoadingState) {
                    ViewsToolbox.showLoading();
                  }
                  if (state is HomeErrorState) {
                    ViewsToolbox.dismissLoading();
                    ViewsToolbox.showErrorAwesomeSnackBar(
                        context, state.message!);
                  }
                },
                builder: (context, state) {
                  if (state is HomeReadyState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HalfCircleChartWidget(
                          leaveUsed: int.parse(
                              state.response.data?.leaveBalance ?? "0"),
                          totalLeave: -1,
                          color: Colors.blueAccent,
                          title: context.tr('annual_leave'),
                        ),
                        SizedBox(
                          height: 100.h,
                          child: VerticalDivider(
                            color: Palette.blue_3B72C5,
                            thickness: 0.2,
                          ),
                        ),
                        HalfCircleChartWidget(
                          leaveUsed: int.parse(
                              state.response.data?.leaveBalance ?? "0"),
                          totalLeave: -1,
                          color: Color(0xFFEDA18C),
                          title: context.tr('sick_leave'),
                        ),
                        SizedBox(
                          height: 100.h,
                          child: VerticalDivider(
                            color: Palette.blue_3B72C5,
                            thickness: 0.2,
                          ),
                        ),
                        HalfCircleChartWidget(
                            leaveUsed: int.parse(
                                state.response.data?.leavDaysTaken ?? "0"),
                            totalLeave: -1,
                            title: context.tr('vacations_used'),
                            color: Color(0xFFFBD823)),
                      ],
                    );
                  } else
                    return Container();
                },
              ),
            ],
          ),
          widget: Column(
            children: [
              20.verticalSpace,
              //create request section
              CreateRequestSection(),
              24.verticalSpace,
              SliderSection(),
              17.verticalSpace,
              RecentUpdatesSection(),
              60.verticalSpace,
            ],
          )),
    );
  }
}
