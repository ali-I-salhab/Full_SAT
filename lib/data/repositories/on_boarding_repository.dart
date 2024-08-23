import 'package:flutter/material.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/helpers/cache_helper.dart';
import 'package:osta/data/models/on_boading_model.dart';
import 'package:osta/presentation/router/routes.dart';

class OnBoardingRepo{
  List<OnBoardingModel> getPages() {
    return const [
      OnBoardingModel(
        image: 'assets/images/maintainance1.jpg',
        heading: 'Plan Your Summer Vacation',
        subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.s',
      ),
      OnBoardingModel(
        image: 'assets/images/maintainance2.jpg',
        heading: 'Luxury Resorts',
        subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      ),
      OnBoardingModel(
        image: 'assets/images/maintainance3.jpg',
        heading: 'Enjoy The Most Beautiful Places',
        subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      ),
    ];
  }

  @override
  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
    required bool isLastBoarding,
  }) {
    if (isLastBoarding) navigateToLoginOrHome(context: context);

    pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  @override
  void navigateToLoginOrHome({required BuildContext context}) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        context.navigateAndReplacement(newRoute: Routes.registerNumberViewRoute);
      }
    });
  }

  void previousPage({required PageController pageController}) {
    pageController.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }
}