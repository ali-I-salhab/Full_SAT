import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/localization/language_cache_helper.dart';
import 'package:osta/core/localization/locale_cubit/locale_cubit.dart';
import 'package:osta/core/utils/nav_bar_enum.dart';
import 'package:osta/logic/auth/auth_cubit.dart';
import 'package:osta/logic/auth/auth_state.dart';
import 'package:osta/logic/navigation_cubit/navigation_cubit.dart';
import 'package:osta/logic/profile/profile_cubit.dart';
import 'package:osta/logic/profile/profile_state.dart';
import 'package:osta/presentation/components/app_error_dialog.dart';
import 'package:osta/presentation/components/app_loading_dialog.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/profile_main_info_card.dart';
import 'package:osta/presentation/components/setting_list_tile.dart';
import 'package:osta/presentation/components/setting_section.dart';
import 'package:osta/presentation/router/app_router.dart';
import 'package:osta/presentation/router/routes.dart';
import 'package:share_plus/share_plus.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: CustomAppBar(title:'common.settings'.tr(context) ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 13.h,),
                ProfileMainInfoCard(
                  profileImage: context.read<ProfileCubit>().user?.image,
                  user: context.read<ProfileCubit>().user,
                ),
                SizedBox(height: 30.h,),

                SettingSection(
                  label: 'setting.profile'.tr(context),
                  settingList: [
                    BlocListener<ProfileCubit, ProfileState>(
                      listener: (context, state) async {
                        if(state is GetUserInfoSuccessState){
                          context.getBack();
                          context.navigateTo(routeName: Routes.profileViewRoute,arguments: state.user);
                        }
                        else if(state is GetUserInfoLoadingState){
                          showAdaptiveDialog<Widget>(
                            context: context,
                            barrierDismissible: false,

                            builder: (context) => const LoadingDialog(),
                          );
                        }
                        else if (state is GetUserInfoErrorState) {
                          context.getBack();
                          showAdaptiveDialog<Widget>(
                            context: context,
                            builder: (context) =>  ErrorDialog(errorText: state.errorMsg),
                          );
                        }
                      },

  child: SettingListTile(
                        icon: Icons.account_circle_outlined,
                        title: 'setting.personal_information'.tr(context),
                    onTap: () {
                          context.read<ProfileCubit>().getUserInfo();
                          // context.navigateTo(routeName: Routes.profileViewRoute);
                    },),
),
                    SettingListTile(
                        icon: Icons.menu_open_outlined, title: 'setting.my_requests'.tr(context),onTap: (){
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavBarItem.requests);
                    },),
                    SettingListTile(
                        icon: Icons.save_alt_outlined, title: 'setting.my_points'.tr(context),onTap: (){},),
                  ],
                ),
                SettingSection(
                  label: 'setting.application'.tr(context),
                  settingList: [
                    SettingListTile(
                      icon: Icons.notifications_none_outlined,
                      title: 'setting.notifications'.tr(context),
                      trailing: SizedBox(
                        height: 40,
                        width: 40,
                        child: FittedBox(
                          child: Switch(
                              activeColor: Theme.of(context).primaryColor,
                              value: true,
                              onChanged: (value) {}),
                        ),
                      ),
                      onTap: (){
                        context.navigateTo(routeName: Routes.notificationViewRoute);
                      },
                    ),
                    SettingListTile(
                      icon: Icons.language_outlined,
                      title: 'common.language'.tr(context),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                      // context.read<LocaleCubit>().state.locale.languageCode),
                      context.read<LocaleCubit>().supportedLanguages.isNotEmpty? context.read<LocaleCubit>().supportedLanguages.singleWhere((element) => element.languageKey == context.read<LocaleCubit>().state.locale.languageCode)?.languageName ??
                            context.read<LocaleCubit>().state.locale.languageCode
                          : context.read<LocaleCubit>().state.locale.languageCode
                            ),
                          Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),onTap: (){
                        context.navigateTo(routeName: Routes.changeLanguageViewRoute);
                    },
                    ),
                  ],
                ),
                SettingSection(
                  label: 'common.others'.tr(context),
                  settingList: [
                    SettingListTile(icon: Icons.share, title: 'setting.share'.tr(context),onTap: ()async{
                        final appUrl = Uri.parse('osta77 google play url');

                        Share.share(appUrl.toString(), subject: 'Get OSTA77 App!');
                    },),
                    SettingListTile(
                        icon: Icons.layers_outlined, title: 'setting.version'.tr(context)),
                    SettingListTile(
                        icon: Icons.privacy_tip_outlined,
                        title: 'setting.privacy_and_security'.tr(context),
                    onTap: (){
                          context.navigateTo(routeName: Routes.termAndConditionViewRoute);
                    },),
                    SettingListTile(icon: Icons.info_outline, title: 'setting.about'.tr(context),
                    onTap: (){
                      context.navigateTo(routeName: Routes.termAndConditionViewRoute);
                    },),
                  ],
                ),
                SettingSection(
                  label: ' ',
                  settingList: [
                    BlocListener<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is UnAuthenticatedState) {
                          context.getBack();
                          context.navigateAndRemoveUntil(newRoute: '/');
                        } else if (state is AuthErrorState) {
                          context.getBack();
                          showAdaptiveDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('common.something_went_wrong'.tr(context)),
                                    content: Text(state.errorMsg),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            context.getBack();
                                          },
                                          child: Text('common.ok'.tr(context)))
                                    ],
                                  ));
                        } else if (state is AuthLoadingState) {
                          showAdaptiveDialog(
                              context: context,
                              builder: (context) => LoadingDialog());
                        }
                      },
                      child: SettingListTile(
                          icon: Icons.logout_rounded,
                          title: 'setting.logout'.tr(context),
                          onTap: () async{
                          await context.read<AuthCubit>().logOut();
                          }),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
