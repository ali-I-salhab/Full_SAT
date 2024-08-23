import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/utils/nav_bar_enum.dart';
import 'package:osta/core/utils/osta_custom_icons_icons.dart';
import 'package:osta/logic/navigation_cubit/navigation_cubit.dart';
import 'package:osta/logic/navigation_cubit/navigation_states.dart';
import 'package:osta/presentation/screens/join_screens/join_us_screen.dart';
import 'package:osta/presentation/screens/requests_screens/requests_screen.dart';
import 'package:osta/presentation/screens/settings/setting_screen.dart';

import '../home_screen/home_screen.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key,this.specifiedRoute}) : super(key: key);
  final int? specifiedRoute;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationStates>(
        builder: (BuildContext context, state) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          extendBodyBehindAppBar:true,
          extendBody: true,
          // backgroundColor: Theme.of(context).colorScheme.primary,
          bottomNavigationBar: SizedBox(
            // height: 78.h,
            child: DotNavigationBar(
              marginR: EdgeInsets.symmetric(horizontal:20.w,vertical: 12.h),
              paddingR: EdgeInsets.symmetric(horizontal:2.w,vertical: 8.h),
              margin: EdgeInsets.zero,
              itemPadding: EdgeInsets.only(right: 6.w,bottom: 5.h,top: 5.h),
              backgroundColor: Theme.of(context).primaryColor,
              currentIndex: state.index,
              curve: Curves.easeInOutCubic,
              enableFloatingNavBar: true,
              // duration: Duration(microseconds: 400),
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavBarItem.home);
                } else if (index == 1) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavBarItem.join);
                } else if (index == 2) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavBarItem.requests);
                } else if (index == 3) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavBarItem.profile);
                }else if (index == 4) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavBarItem.whatsapp);
                }
              },
              items: [
                DotNavigationBarItem(
                  icon: Icon(
                    // OstaCustomIcons.home,
                    Iconsax.home_2_copy,
                    color: Colors.white,
                  ),
                ),
                DotNavigationBarItem(
                    icon: Icon(
                  OstaCustomIcons.join,
                  color: Colors.white,
                )),
                DotNavigationBarItem(
                    icon: Icon(
                  // OstaCustomIcons.requests,
                  // OstaCustomIcons.requests,
                      Iconsax.note_2_copy,
                  color: Colors.white,
                )),
                DotNavigationBarItem(
                    icon: Icon(
                  // OstaCustomIcons.setting2,
                  //     CupertinoIcons.gear_alt,
                      Iconsax.setting_2_copy,
                  color: Colors.white,
                )),
                DotNavigationBarItem(
                    icon: Icon(
                  // Icons.call,
                  Iconsax.whatsapp_copy,
                  color: Colors.white,
                )),
              ],
              dotIndicatorColor: Colors.white,
              borderRadius: 8.r,
              enablePaddingAnimation: true,
            ),
          ),

          body: BlocBuilder<NavigationCubit, NavigationStates>(
              builder: (BuildContext context, state) {
            NavigationCubit navigationCubit = NavigationCubit.get(context);
            return WillPopScope(
                onWillPop: () {
                  if (state.navbarItem != NavBarItem.home) {
                    navigationCubit.getNavBarItem(NavBarItem.home);
                    return Future.value(false);
                  }
                  return Future.value(true);
                },
                child: state.navbarItem == NavBarItem.home
                    ? HomeScreen()
                    : state.navbarItem == NavBarItem.profile
                        ? SettingScreen()
                        : state.navbarItem == NavBarItem.join
                            ? JoinUsMainScreen()
                            : state.navbarItem == NavBarItem.requests
                                ? RequestScreen()
                                : Container());
          }),
        ),
      );
    });
  }
}
