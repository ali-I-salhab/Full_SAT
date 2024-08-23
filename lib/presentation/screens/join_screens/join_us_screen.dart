import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/core/utils/osta_custom_icons_icons.dart';
import 'package:osta/presentation/components/category_card.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/custom_about_dialog.dart';
import 'package:osta/presentation/components/setting_list_tile.dart';
import 'package:osta/presentation/router/routes.dart';

class JoinUsMainScreen extends StatelessWidget {
  const JoinUsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'common.join_us'.tr(context),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 174.w / 174.h,
            mainAxisExtent: 174.w,
            crossAxisCount: 2,
            crossAxisSpacing: 11.w,
            mainAxisSpacing: 11.w,
          ),
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          children: [
            InkWell(
                onTap: () async {
                  await showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return CustomAboutDialog(aboutJoining: '''Nowadays, forgery has become a popular phenom, where billions ofcounterfeit and sub-standard products are out to the world without the consentand permission of the original manufacturer. This situation has led to immenserevenue losses for the actual brand owners, distrust of customers, and brandreputation tarnishing.
                        led to immenserevenue losses for the actual brand owners, distrust of customers, and  ''',
                          onTap: (){
                            context.getBack();
                            context.navigateTo(
                                routeName: Routes.workerApplicationViewRoute);
                            },
     );
                      });
                },
                child: CategoryCard(
                  title: 'common.worker'.tr(context),
                  image: 'assets/images/worker.png',
                )),
            InkWell(
                onTap: () async {
                  await showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return CustomAboutDialog(aboutJoining: '''Nowadays, forgery has become a popular phenom, where billions ofcounterfeit and sub-standard products are out to the world without the consentand permission of the original manufacturer. This situation has led to immenserevenue losses for the actual brand owners, distrust of customers, and brandreputation tarnishing.
                        led to immenserevenue losses for the actual brand owners, distrust of customers, and  ''',
                          onTap: (){
                            context.getBack();
                            context.navigateTo(
                                routeName:
                                Routes.workShopApplicationViewRoute);
                          },
                        );
                      //       return CupertinoAlertDialog(
                      //     content: Text(
                      //         ''' Nowadays, forgery has become a popular phenom, where billions ofcounterfeit and sub-standard products are out to the world without the consentand permission of the original manufacturer. This situation has led to immenserevenue losses for the actual brand owners, distrust of customers, and brandreputation tarnishing.
                      // led to immenserevenue losses for the actual brand owners, distrust of customers, and  '''),
                      //     actions: [
                      //       TextButton(
                      //           onPressed: () {
                      //             context.getBack();
                      //           },
                      //           child: Text('cancel')),
                      //       TextButton(
                      //           onPressed: () {
                      //             context.getBack();
                      //             context.navigateTo(
                      //                 routeName:
                      //                     Routes.workShopApplicationViewRoute);
                      //           },
                      //           child: Text('ok')),
                      //     ],
                      //   );
                      });
                },
                child: CategoryCard(
                  title: 'common.workshop'.tr(context),
                  image: 'assets/images/workshop.png',
                )),
            InkWell(
                onTap: () async {
                  await showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return CustomAboutDialog(aboutJoining: '''Nowadays, forgery has become a popular phenom, where billions ofcounterfeit and sub-standard products are out to the world without the consentand permission of the original manufacturer. This situation has led to immenserevenue losses for the actual brand owners, distrust of customers, and brandreputation tarnishing.
                        led to immenserevenue losses for the actual brand owners, distrust of customers, and  ''',
                          onTap: () {
                          context.getBack();
                          context.navigateTo(
                              routeName:
                              Routes.transportApplicationViewRoute);
                        },
                        );
                      //   CupertinoAlertDialog(
                      //     content: Text(
                      //         ''' Nowadays, forgery has become a popular phenom, where billions ofcounterfeit and sub-standard products are out to the world without the consentand permission of the original manufacturer. This situation has led to immenserevenue losses for the actual brand owners, distrust of customers, and brandreputation tarnishing.
                      // led to immenserevenue losses for the actual brand owners, distrust of customers, and  '''),
                      //     actions: [
                      //       TextButton(
                      //           onPressed: () {
                      //             context.getBack();
                      //           },
                      //           child: Text('cancel')),
                      //       TextButton(
                      //           onPressed: () {
                      //             context.getBack();
                      //             context.navigateTo(
                      //                 routeName:
                      //                     Routes.transportApplicationViewRoute);
                      //           },
                      //           child: Text('ok')),
                      //     ],
                      //   );
                      });
                },
                child: CategoryCard(
                  title: 'common.transport'.tr(context),
                  image: 'assets/images/transport.png',
                )),
            InkWell(
                onTap: () async {
                  await showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return CustomAboutDialog(aboutJoining: '''Nowadays, forgery has become a popular phenom, where billions ofcounterfeit and sub-standard products are out to the world without the consentand permission of the original manufacturer. This situation has led to immenserevenue losses for the actual brand owners, distrust of customers, and brandreputation tarnishing.
                        led to immenserevenue losses for the actual brand owners, distrust of customers, and  ''',
                          onTap: () {
                            context.getBack();
                            context.navigateTo(
                                routeName:
                                Routes.storeApplicationViewRoute);
                          },
                        );

                      //   return CupertinoAlertDialog(
                      //     content: Text(
                      //         ''' Nowadays, forgery has become a popular phenom, where billions ofcounterfeit and sub-standard products are out to the world without the consentand permission of the original manufacturer. This situation has led to immenserevenue losses for the actual brand owners, distrust of customers, and brandreputation tarnishing.
                      // led to immenserevenue losses for the actual brand owners, distrust of customers, and  '''),
                      //     actions: [
                      //       TextButton(
                      //           onPressed: () {
                      //             context.getBack();
                      //           },
                      //           child: Text('cancel')),
                      //       TextButton(
                      //           onPressed: () {
                      //             context.getBack();
                      //             context.navigateTo(
                      //                 routeName:
                      //                     Routes.storeApplicationViewRoute);
                      //           },
                      //           child: Text('ok')),
                      //     ],
                      //   );
                      });
                },
                child: CategoryCard(
                  title: 'common.store'.tr(context),
                  image: 'assets/images/store.png',
                )),
          ],
        )

        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       SettingListTile(icon: OstaCustomIcons.worker, title: 'Are you a worker ?',
        //       onTap: (){
        //         context.navigateTo(routeName: Routes.workerApplicationViewRoute);
        //       },
        //       ),
        //       SettingListTile(icon: OstaCustomIcons.teamwork_1, title: 'Are you a workshop ?'),
        //       SettingListTile(icon: OstaCustomIcons.warehouse, title: 'Are you a store ?'),
        //       SettingListTile(icon: OstaCustomIcons.truck, title: 'Are you a means of transport ?'),
        //
        //     ],
        //   ),
        // ),
        );
  }
}
