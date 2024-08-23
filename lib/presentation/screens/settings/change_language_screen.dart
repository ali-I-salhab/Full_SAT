import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/localization/locale_cubit/locale_cubit.dart';
import 'package:osta/core/localization/locale_cubit/locale_state.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_loading_dialog.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
          title: 'setting.change_application_language'.tr(context)),
      body: BlocConsumer<LocaleCubit, ChangeLocaleState>(
        listener: (context, state) {
          if(state.loading){
            showAdaptiveDialog<Widget>(
              context: context,
              barrierDismissible: false,
              builder: (context) => const LoadingDialog(),
            );
          }
          else context.getBack();
        },
        builder: (context, state) {
          final languages = context.read<LocaleCubit>().supportedLanguages;
          // print(state.languages[0].languageKey);
          // print(context.read<LocaleCubit>().supportedLanguages[0].languageKey);
          String choseLang = state.locale.languageCode;
          print(choseLang);
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                StatefulBuilder(
                  builder: (context, setState) => ListView(
                    shrinkWrap: true,
                    children: [
                      for (int index = 0; index < languages.length; index += 1)
                        ListTile(
                          key: Key('$index'),
                          leading: Text(
                            '${index + 1}',
                            style: TextStyle(color: AppColors.secondaryColor),
                          ),
                          title: Text(languages[index].languageName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                          trailing: Icon(
                            Icons.check_circle_outline_outlined,
                            color:
                                // state.locale.languageCode ==
                                choseLang == languages[index].languageKey
                                    ? AppColors.primaryColor
                                    : Colors.grey,
                            size: 24.w,
                          ),
                          // Icon(Icons.reorder_outlined),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 4.h),
                          onTap: () async {
                            setState(
                                () => choseLang = languages[index].languageKey);
                            print(choseLang);
                            // await context
                            //     .read<LocaleCubit>()
                            //     .changeLanguage(languages[index].languageKey);
                          },
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 53.h,
                ),
                AppButton(
                    onTap: () async {
                      print(choseLang);
                      await context
                          .read<LocaleCubit>()
                          .changeLanguage(choseLang);
                    },
                    buttonText: 'Change Language')
              ],
            ),
          );
        },
      ),
    ));
  }
}
