import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/presentation/components/offer_card.dart';

class OfferSlider extends StatelessWidget {
  const OfferSlider({Key? key,this.cardHeight}) : super(key: key);
  final double? cardHeight;

  @override
  Widget build(BuildContext context) {
    return
      CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index, int realIndex) {
      return
       OfferCard(imageUrl: "assets/images/maintainance2.jpg",);
    },
    options: CarouselOptions(
    autoPlay: true,
    autoPlayInterval: const Duration(seconds: 5),
    viewportFraction: 1.0,
    enableInfiniteScroll: true,
    padEnds: false,
    autoPlayCurve: Curves.easeInOutCirc,
    disableCenter: false,
    pauseAutoPlayOnTouch: true,
    animateToClosest: true,
    height:cardHeight ?? 177.h,
    )
    );
}
}
