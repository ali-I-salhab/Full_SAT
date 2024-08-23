import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/helpers/cache_helper.dart';
import 'package:osta/presentation/router/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;

  @override
  void initState() {
    _startDelay();
    setSystemUIOverlayStyle();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startDelay() {
    _timer = Timer(const Duration(milliseconds: 500), () => _goToNext());
  }

  void _goToNext() {
    bool? onBoarding = CacheHelper.getBoolData(key: 'onBoarding');
    final String? utok = CacheHelper.getStringData(key: 'userToken');
    // int? userId = CacheHelper.getIntData(key: 'userId');

    print(utok);
    if (onBoarding != null) {
      if (utok != null ) {
        context.navigateAndRemoveUntil(newRoute: Routes.layoutViewRoute);
      }
      if(utok == null || utok == ''){
        context.navigateAndRemoveUntil(newRoute: Routes.registerNumberViewRoute);
      }
    } else {
      context.navigateAndRemoveUntil(newRoute: Routes.onBoardingViewRoute);
    }
  }

  void setSystemUIOverlayStyle() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        decoration: const BoxDecoration(
          // image: DecorationImage(
          // image: AssetImage(AppAssets.imageSplashCover),
          // fit: BoxFit.cover,
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: context.height * 0.13),
            Image.asset('assets/images/osta_logo.png'),
            // SizedBox(height: context.height*0.02,),
            // Text(
            //   'OSTA77',
            //   style: AppTextStyles.splashTextStyle,
            // ),
          ],
        ),
      ),
    );
  }
}

