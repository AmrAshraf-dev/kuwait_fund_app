import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/tab_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() =>
      _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> with TickerProviderStateMixin {
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
        screenTitle: context.tr("contact_us"),
        isBackEnabled: true,
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
                                            : Palette.gery_6C6D6F),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: AppText(
                                          text: context.tr("contact_info"),
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
                                            : Palette.gery_6C6D6F),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: AppText(
                                        text: context.tr("map"),
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
                                        text: context.tr("telephone_fax"),
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
              height: 600.h,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  ContactInfoWidget(),
                  MapWidget(),
                  TelephoneFaxWidget(),
                ],
              ),
            ),
          ],
        ),
    );
  }
}

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitleWidget(
              title: context.tr('you_can_send_message'),
          ),
          20.verticalSpace,
          AppText(
            text: context.tr("operations"),
            style: AppTextStyle.regular_18,
          ),
          AppText(
            text: "operations@kuwait-fund.org",
            style: AppTextStyle.regular_18,
            textColor: Palette.blue_3B72C5,
          ),

          20.verticalSpace,
          AppText(
            text: context.tr("webmaster"),
            style: AppTextStyle.regular_18,
          ),
          AppText(
            text: "info@kuwait-fund.org",
            style: AppTextStyle.regular_18,
            textColor: Palette.blue_3B72C5,
          ),
          30.verticalSpace,

          MainTitleWidget(
              title: context.tr('address'),
          ),
          10.verticalSpace,
          AppText(
            text: "Kuwait Fund for Arab Economic Development\nMirqab\nMubarak Al-Kabeer St.\nKuwait City\nP.O. Box 2921 Safat 13030 Kuwait\nState of Kuwait",
            style: AppTextStyle.regular_14,
          ),
        ],
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: Center(
        child: AppText(
          text: context.tr("map"),
          style: AppTextStyle.regular_18,
        ),
      )
    );
  }
}

class TelephoneFaxWidget extends StatelessWidget {
  const TelephoneFaxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: Center(
        child: AppText(
          text: context.tr("telephone_fax"),
          style: AppTextStyle.regular_18,
        ),
      )
    );
  }
}
