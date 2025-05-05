import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/icons.dart';
import '../../core/routes/routes.gr.dart';
import '../../core/utility/palette.dart';
import '../shared/data/local_data.dart';
import '../../gen/assets.gen.dart';

@RoutePage()
class NavigationMainScreen extends StatefulWidget {
  const NavigationMainScreen({super.key});

  @override
  State<NavigationMainScreen> createState() => _NavigationMainScreenState();
}

class _NavigationMainScreenState extends State<NavigationMainScreen> {

    late final List<PageRouteInfo> routes;
bool isSupervisor=LocalData.getUser()?.userInfo.isSupervisor == true &&
          LocalData.getUser()?.userInfo.isDirector != true;
 late List<String> screensTitles;
  @override
  void initState() {
    super.initState();
screensTitles = <String>[
    "home",
    "requests",
      if(isSupervisor)
     "submissions",
    "more",
  ];


    routes = [
      const HomeRoute(),
        RequestsRoute(isBackButtonEnabled: false),
              if(isSupervisor)
          SubmissionsRoute(isBackButtonEnabled: false),
      const MoreRoute(),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return   
    
       PopScope(
          canPop: false,
          child: Stack(
            children: <Widget>[
              AutoTabsScaffold(
                resizeToAvoidBottomInset: false,
                routes:   routes,
                bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
                  return buildBottomBar(tabsRouter);
                },
              ),
            ],
          )
    );
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
                if(isSupervisor)
              BottomNavigationBarItem(
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 9.h, top: 18.h),
                          child: Assets.svg.submissions.svg()),
                      activeIcon: Padding(
                        padding: EdgeInsets.only(
                          bottom: 9.h,
                          top: 18.h,
                        ),
                        child: Assets.svg.submissions.svg(color: Colors.white),
                      ),
                      label: context.tr('submissions'),
                    ),

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
