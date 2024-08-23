import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/logic/on_boarding/on_boarding_cubit.dart';
import 'package:osta/logic/on_boarding/on_boarding_slider.dart';
import 'package:osta/logic/on_boarding/on_boarding_state.dart';
import 'package:osta/presentation/components/app_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          OnBoardingCubit cubit = OnBoardingCubit.get(context);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OnBoardingSlider(controller: cubit.carouselController, pageInfo: cubit.getPages()),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      cubit.getPages().first.heading,
                      style: AppTextStyles.onBoardingHeadingTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      cubit.getPages().first.subHeading,
                      style: AppTextStyles.textStyle15,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: context.height*0.1),
                  AppButton(onTap: (){
                    cubit.navigateToLoginOrHome(context: context);
                  }, buttonText: 'on_boarding.get_started'.tr(context))
                ],
              );
            },
      ),
    );
  }
}
