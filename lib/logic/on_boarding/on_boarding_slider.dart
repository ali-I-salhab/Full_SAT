
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/data/models/on_boading_model.dart';

class OnBoardingSlider extends StatefulWidget {

  OnBoardingSlider({Key? key ,required this.controller , required this.pageInfo}) : super(key: key);
  final CarouselController controller ;
  final List<OnBoardingModel> pageInfo;

  @override
  State<OnBoardingSlider> createState() => _OnBoardingSliderState();
}

int current = 0 ;

class _OnBoardingSliderState extends State<OnBoardingSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          carouselController:widget.controller,
          options: CarouselOptions(
            // aspectRatio: 19/7,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlay: true,
              reverse: false,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
              height: context.height*0.4,

              autoPlayInterval: Duration(seconds: 5),
              onPageChanged: (index,reason){
                setState(() {
                  current = index ;
                });
              }
          ),
          items: widget.pageInfo.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    // height: context.height*0.4,
                    width: double.infinity,
                    child: ClipRRect(
                      child: Image.asset(
                        i.image,
                        fit: BoxFit.cover,
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.pageInfo.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => widget.controller.animateToPage(entry.key),
              child: Container(
                width: 5.0,
                height: 5.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor
                        .withOpacity(current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
