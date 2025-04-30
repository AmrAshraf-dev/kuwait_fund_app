import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/shared/data/local_data.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      FlutterNativeSplash.remove();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      if (LocalData.getUser() != null &&
          LocalData.getUser()?.tokenInfo.token.isNotEmpty == true) {
      
          CustomMainRouter.push(NavigationMainRoute());
        
      } else {
        CustomMainRouter.push(const AuthRoute());
      }
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
