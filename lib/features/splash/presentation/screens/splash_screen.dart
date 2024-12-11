import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/splash/presentation/cubits/splash_cubit.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashCubit _splashCubit = getIt<SplashCubit>();
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      FlutterNativeSplash.remove();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      try {
        //     CustomMainRouter.navigate(const AuthRoute());
        CustomMainRouter.push(const AuthRoute());
      } catch (e) {
        debugPrint('Navigation Error: $e');
      }

      //CustomMainRouter.push(const NavigationMainRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());

    // BlocProvider<SplashCubit>.value(
    //   value: _splashCubit,
    //   child: BlocListener<SplashCubit, SplashState>(
    //     listener: (BuildContext context, SplashState state) {
    //       if (state is SplashTokenExpiredState) {
    //         CustomMainRouter.push(const LoginRoute());
    //       } else if (state is SplashTokenValidState) {
    //         CustomMainRouter.navigate(
    //             NavigationMainRoute(children: <PageRouteInfo>[
    //           HomeProfileRoute(),
    //         ]));
    //       }
    //     },

    //   ),
    // ),
    // );
  }
}
