import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferCard extends StatelessWidget {
   OfferCard({Key? key,required this.imageUrl}) : super(key: key);
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 0,),
      // padding: EdgeInsets.symmetric(horizontal: 32.w),
      width: double.infinity,
      child: Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),),
          child:ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Image.asset(imageUrl,fit: BoxFit.cover)),
      ),
    );
  }
}
