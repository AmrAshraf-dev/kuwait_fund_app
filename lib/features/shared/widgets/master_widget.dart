import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/icons.dart';
import '../../../core/constants/images.dart';
import '../../../core/helper/language_helper.dart';
import '../../../core/routes/route_sevices.dart';
import '../../../core/routes/routes.dart';
import '../../../core/utility/palette.dart';
import '../../di/dependency_init.dart';
import 'app_text.dart';
import 'drawer_widget.dart';

import '../../../core/constants/general_constants.dart';
import '../../../core/helper/view_toolbox.dart';
import 'no_internet_connection.dart';

class MasterWidget extends StatefulWidget {
  const MasterWidget(
      {super.key,
      this.path,
      this.patternExtension,
      required this.widget,
      this.patternHeight,
      this.hasScroll = true,
      this.hasFoucs = false,
      this.hasInternet,
      this.isSupportOffline = false,
      this.screenTitle,
      this.appBar,
      this.floatingActionButton,
      this.drawer,
     required  this.isBackEnabled ,
      this.isDrawerEnabled = false,
      this.appBarHeight = 120.0,
      this.appBarBody,
      this.actions = const [],
      this.waterMarkImage = waterMarkImage2,
      this.onBackTap});

  final DrawerSideMenu? drawer;
  final Widget? floatingActionButton;
  final String? path;
  final PatternExtension? patternExtension;
  final Widget widget;
  final double? patternHeight;
  final bool? hasScroll;
  final bool? hasFoucs;
  final bool? isSupportOffline;
  final Function(bool)? hasInternet;
  final String? screenTitle;
  final dynamic appBar;
  final bool? isBackEnabled;
  final bool isDrawerEnabled;
  final double appBarHeight;
  final Widget? appBarBody;
  final List<Widget> actions;
  final String? waterMarkImage;
  final void Function()? onBackTap;

  @override
  State<MasterWidget> createState() => _MasterWidgetState();
}

enum PatternExtension { png, svg }

class _MasterWidgetState extends State<MasterWidget> {
  List<ConnectivityResult> connectionResult = <ConnectivityResult>[];
  ValueNotifier<bool> hasInternet = ValueNotifier<bool>(true);
  late StreamSubscription<bool> keyboardSubscription;
  ValueNotifier<bool> isKeyboardVisible = ValueNotifier<bool>(false);
  final KeyboardVisibilityController keyboardVisibilityController =
      KeyboardVisibilityController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      hasInternet.value = await ViewsToolbox.checkConnection();
    });

    // Log the initial keyboard visibility state.
    print(
        'Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    // Subscribe to keyboard visibility changes.
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      isKeyboardVisible.value = visible;
      if (mounted) {
        setState(() {});
      }

      print('Keyboard visibility update. Is visible: $visible');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white_F5F4F9,
        floatingActionButton: widget.floatingActionButton,
        drawer: widget.drawer,
        appBar: widget.appBar ??
            PreferredSize(
              preferredSize: Size.fromHeight(widget.appBarHeight),
              child: Stack(
                children: [
                  if (widget.appBarBody != null)
                    Container(
                      height: widget.appBarHeight.h,
                      decoration: ShapeDecoration(
                        color: Palette.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.r),
                              bottomRight: Radius.circular(30.r)),
                        ),
                      ),
                    ),
                  if (widget.appBarBody != null)
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left:    1.sw / 2.5,
                      child: Image.asset(
                        fit: BoxFit.fill,
                        widget.waterMarkImage!,
                        color: Colors.white,
                      ),
                    ),
                  if (widget.appBarBody == null)
                    Container(
                      decoration: ShapeDecoration(
                        color: Palette.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.r),
                              bottomRight: Radius.circular(30.r)),
                        ),
                      ),
                    ),
                  if (widget.appBarBody == null)
                    Positioned(
                      top: 40,
                      bottom: 0,
                      right: 0,
                      left: 1.sw / 3,
                      child: Image.asset(
                        fit: BoxFit.fill,
                        widget.waterMarkImage!,
                        color: Colors.white,
                      ),
                    ),
                  // Gradient overlay (optional for better readability of foreground text)
                  Container(
                    height: widget.appBarHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  // Widgets above the background image
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: widget.appBarBody != null
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                          children: [
                            10.verticalSpace,
                            Stack(
                              children: [
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: widget.isBackEnabled??true
                                      ? GestureDetector(
                                          onTap: widget.onBackTap ??
                                              () {
                                                final router = getIt<AppRouter>();

if (router.canPop()) {
  router.back(); // or router.back();
}

                                               //    getIt<AppRouter>().navigatorKey.currentContext!.router.back();

                                              },
                                          child: Container(
                                            height: 38.h,
                                            width: 38.w,
                                            padding: EdgeInsets.zero,
                                            decoration: BoxDecoration(
                                              color: Palette.yellow_FBD823,
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            child: Padding(
                                              padding:  EdgeInsets.only(left:LanguageHelper.isAr(context)?0:8
                                                  .w, ),
                                              child: Icon(
                                                 size: 20.sp,
                                                LanguageHelper.isAr(context)
                                                    ? Icons.arrow_forward_ios
                                                    : Icons.arrow_back_ios,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      : widget.isDrawerEnabled
                                          ? Builder(builder: (scaffoldContext) {
                                              return InkWell(
                                                onTap: () {
                                                  Scaffold.of(scaffoldContext)
                                                      .openDrawer();
                                                },
                                                child:
                                                    LanguageHelper.isAr(context)
                                                        ? SvgPicture.asset(
                                                            drawerArIcon)
                                                        : SvgPicture.asset(
                                                            drawerIcon),
                                              );
                                            })
                                          : SizedBox.shrink(),
                                ),
                                if (widget.screenTitle != null)
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: 1.sw - 150.w,
                                      child: Center(
                                        child: AppText(
                                            text: widget.screenTitle,
                                            style: AppTextStyle.bold_24,
                                            textColor: Colors.white),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: LanguageHelper.isAr(context)
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: widget.actions,
                                  ),
                                ),
                              ],
                            ),
                            20.verticalSpace,
                            if (widget.appBarBody != null) widget.appBarBody!
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        //  backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          bottom: Platform.isAndroid ? true : false,
          child: SizedBox(
            width: 1.sw,
            child: StreamBuilder<List<ConnectivityResult>>(
                stream: Connectivity().onConnectivityChanged,
                builder: (BuildContext context,
                    AsyncSnapshot<List<ConnectivityResult>> snapshot) {
                  if (snapshot.data != null) {
                    if (snapshot.data?.first == ConnectivityResult.none) {
                      ViewsToolbox.dismissLoading();
                      GeneralConstants.hasConnection = false;

                      widget.hasInternet?.call(false);
                      if (GeneralConstants.hasConnection == true) {
                        GeneralConstants.hasConnection = false;
                      }
                    } else {
                      hasInternet.value = true;

                      if (hasInternet.value &&
                          GeneralConstants.hasConnection == false) {
                        widget.hasInternet?.call(true);
                      }
                      if (GeneralConstants.hasConnection == false) {
                        GeneralConstants.hasConnection = true;
                      }
                    }
                  }
                  return ValueListenableBuilder<bool>(
                    valueListenable: hasInternet,
                    builder:
                        (BuildContext context, bool value, Widget? child) =>
                            widget.hasScroll!
                                ? SingleChildScrollView(
                                    reverse: isKeyboardVisible.value,
                                    child: widget.isSupportOffline!
                                        ? widget.widget
                                        : snapshot.data?.first ==
                                                    ConnectivityResult.none ||
                                                !hasInternet.value
                                            ? const NoInternetConnection()
                                            : widget.widget,
                                  )
                                : widget.isSupportOffline!
                                    ? widget.widget
                                    : snapshot.data?.first ==
                                                ConnectivityResult.none ||
                                            !hasInternet.value
                                        ? const NoInternetConnection()
                                        : widget.widget,
                  );
                }),
          ),
        ));
  }
}
