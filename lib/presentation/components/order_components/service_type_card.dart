import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/utils/app_text_styles.dart';

class ServiceTypeCard extends StatelessWidget {
  const ServiceTypeCard({super.key,required this.serviceType,this.serviceName});
  final String serviceType;
  final String? serviceName;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: Card(
        // elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r)
        ),
        semanticContainer: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
          Expanded(
            flex: 0,
            child: Container(
              width: 120.w,
              // padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8.r),
                            // topLeft: Radius.circular(8.r),
                            // bottomLeft: Radius.circular(8.r))
            ),
                child: Center(child: Text(serviceName ?? 'Services',style:AppTextStyles.whiteTitleTextStyle ))),
          ),
          Expanded(child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22.w,vertical: 12.h),
          child: Text(serviceType,style: AppTextStyles.title3TextStyle,))),

        ]),
      ),
    );

    // return Card(
    //   // width: double.infinity,
    //   margin: EdgeInsets.symmetric(horizontal: 20),
    //     elevation: 2,
    //     // context.width * 0.05),
    //   // padding: EdgeInsets.symmetric(horizontal: context.width*0.05),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Expanded(
    //         flex: 1,
    //         child: Container(
    //           // margin: EdgeInsets.only(left: 10),
    //           // padding: EdgeInsets.all(12),
    //           decoration: BoxDecoration(
    //               color: Theme.of(context).primaryColor,
    //               borderRadius: BorderRadius.only(
    //                   topLeft: Radius.circular(8),
    //                   bottomLeft: Radius.circular(8))),
    //           child: SizedBox(child: Text('Services',style: TextStyle(fontSize: 18,color: Colors.white),)),
    //         ),
    //       ),
    //       Expanded(
    //         flex: 2,
    //         child: Container(
    //           // width: double.infinity,
    //           margin: EdgeInsets.only(right: 10),
    //           // padding: EdgeInsets.all(8),
    //           padding: EdgeInsets.only(right: 20,top: 4,bottom: 4,left: 12),
    //           decoration:const BoxDecoration(
    //             borderRadius: BorderRadius.only(
    //                 topRight: Radius.circular(8),
    //                 bottomRight: Radius.circular(8)),
    //             color: Colors.white,
    //           ),
    //           child: Text(serviceType),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
