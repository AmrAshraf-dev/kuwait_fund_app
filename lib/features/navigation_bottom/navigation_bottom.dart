import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kf_ess_mobile_app/core/constants/icons.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';

@RoutePage()
class NavigationMainScreen extends StatefulWidget {
  const NavigationMainScreen({super.key});

  @override
  State<NavigationMainScreen> createState() => _NavigationMainScreenState();
}

class _NavigationMainScreenState extends State<NavigationMainScreen> {
  List<String> screensTitles = <String>[
    "home",
    "requests",
   // "insurance",
    "more",
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Stack(
          children: <Widget>[
            AutoTabsScaffold(
              resizeToAvoidBottomInset: false,
              routes: <PageRouteInfo>[
                const HomeRoute(),
                const RequestsRoute(),
              //  const InsuranceRoute(),
                const MoreRoute()
              ],
              bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
                return buildBottomBar(tabsRouter);
              },
            ),
          ],
        ));
  }

  Widget buildBottomBar(TabsRouter tabsRouter) {
    return PopScope(
      canPop: tabsRouter.activeIndex == 0,
      onPopInvoked: (bool didPop) async {
        if (!didPop) {
          tabsRouter.setActiveIndex(0);
        }
      },
      child: Offstage(
          offstage: context.topRouteMatch.meta['hideBottomNav'] == true
              ? true
              : false,
          child: Container(
              // height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0.r),
                  topRight: Radius.circular(30.0.r),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Palette.blue_002A69,
                  selectedFontSize: 12.sp,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  selectedLabelStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  selectedItemColor: Palette.white,
                  selectedIconTheme: const IconThemeData(color: Palette.white),
                  unselectedItemColor: Palette.gray_C6C6C6,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 9.h, top: 18.h),
                          child: SvgPicture.asset(home)),
                      activeIcon: Padding(
                          padding: EdgeInsets.only(bottom: 9.h, top: 18.h),
                          child: SvgPicture.asset(
                            home,
                            color: Colors.white,
                          )),
                      label: context.tr('home'),
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 9.h, top: 18.h),
                          child: SvgPicture.asset(requests)),
                      activeIcon: Padding(
                          padding: EdgeInsets.only(bottom: 9.h, top: 18.h),
                          child: SvgPicture.asset(
                            requests,
                            color: Colors.white,
                          )),
                      label: context.tr('my_requests'),
                    ),
                    // BottomNavigationBarItem(
                    //   icon: Padding(
                    //       padding: EdgeInsets.only(
                    //         bottom: 9.h,
                    //         top: 18.h,
                    //       ),
                    //       child: SvgPicture.asset(insurance)),
                    //   activeIcon: Padding(
                    //       padding: EdgeInsets.only(
                    //         bottom: 9.h,
                    //         top: 18.h,
                    //       ),
                    //       child: SvgPicture.asset(
                    //         insurance,
                    //         color: Colors.white,
                    //       )),
                    //   label: context.tr('insurance'),
                    // ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 9.h, top: 18.h),
                        child: SvgPicture.asset(more),
                      ),
                      activeIcon: Padding(
                        padding: EdgeInsets.only(bottom: 9.h, top: 18.h),
                        child: SvgPicture.asset(
                          more,
                          color: Colors.white,
                        ),
                      ),
                      label: context.tr('more'),
                    ),
                  ],
                  currentIndex: tabsRouter.activeIndex,
                  onTap: (int index) {
                    if (index == tabsRouter.activeIndex) {
                      tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
                    } else {
                      tabsRouter.setActiveIndex(index);
                    }
                  },
                ),
              ))),
    );
  }
}
