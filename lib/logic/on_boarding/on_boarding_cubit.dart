import 'dart:async';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/data/repositories/on_boarding_repository.dart';

import '../../data/models/on_boading_model.dart';
import 'on_boarding_state.dart';



class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  static OnBoardingCubit get(BuildContext context) => BlocProvider.of<OnBoardingCubit>(context);

  OnBoardingRepo onBoardingRepo = OnBoardingRepo();
  CarouselController carouselController = CarouselController();

  // PageController pageController = PageController(initialPage: 0);
  // int currentIndex = 0;
  // bool isLastBoarding = false;
  // late Timer timer ;
  // int pageIndex = 0;
  List<OnBoardingModel> getPages() {
    return onBoardingRepo.getPages();
  }

  // void onPageChanged(int index) {
  //     pageIndex = index;
  //     emit(PageViewIndexChangedState(index: pageIndex));
  //   }
  // void onChangePageIndex() {
    // if (index == getPages().length - 1) {
    //   isLastBoarding = true;
    // } else {
    //   isLastBoarding = false;
    //  timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
    //     navigateBetweenPages(context: context);
    //     emit(PageViewIndexChangedState(index: index));
    //     //   if (currentIndex < 2) {
    //   //     currentIndex++;
    //   //    onBoardingRepo.navigateBetweenPages(
    //   //      context:
    //   //    );
    //   //     pageController.animateToPage(
    //   //       currentIndex,
    //   //       duration: Duration(milliseconds: 350),
    //   //       curve: Curves.easeIn,
    //   //     );
    //   //   } else {
    //   //     currentIndex = 2;
    //   //   }
    //   });
    // }
    // timer = Timer.periodic(const Duration(seconds: 5), (timer) {
    //   pageController.animateToPage(pageIndex,
    //       duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);
    //   if(pageIndex == getPages().length ) {
    //     print(pageIndex);
    //     pageIndex = 0;
    //   }
    //   pageIndex++;
    //   pageController.animateToPage(
    //     pageIndex,
    //     duration: Duration(milliseconds: 350),
    //     curve: Curves.easeIn,
    //   );
    //   emit(NavigateBetweenPages());
    //
    //       emit(PageViewIndexChangedState(index: pageIndex));
    // });
  // }
  //
  // void navigateBetweenPages({
  //   required BuildContext context,
  // }) {
  //   timer = Timer.periodic(const Duration(seconds: 5), (timer) {
  //
  //     if(pageIndex == getPages().length -1) {
  //       print(pageIndex);
  //       pageIndex = 0;
  //       emit(NavigateBetweenPages());
  //     }
  //     pageIndex++;
  //     onBoardingRepo.navigateBetweenPages(
  //       context: context,
  //       pageController: pageController,
  //       isLastBoarding: false,
  //     );
  //     emit(NavigateBetweenPages());
  //   });
  //
  // }
  //
  void navigateToLoginOrHome({required BuildContext context}) {
    onBoardingRepo.navigateToLoginOrHome(context: context);

    emit(SkipToSignInOrHome());
  }
  //
  // void previousPage({required PageController pageController}) {
  //   onBoardingRepo.previousPage(pageController: pageController);
  //
  //   emit(MoveToPreviousPage());
  // }
}
