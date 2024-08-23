import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/order_models/field_value.dart';
import 'package:osta/data/models/order_models/order_details.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/category_card.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/horizental_counter_component.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/order_components/appointment_booking_widget.dart';
import 'package:osta/presentation/components/order_components/service_type_card.dart';
import 'package:osta/presentation/components/order_components/title_subtitle_detail.dart';
import 'package:osta/presentation/components/upload_multiple_images_widget.dart';
import 'package:osta/presentation/router/routes.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.orderDetails});

  final OrderDetails orderDetails;

  @override
  Widget build(BuildContext context) {
    int selectedOffer = 0 ;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Order Details'),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              // orderDetails.formMainInfo.
              ServiceTypeCard(
                serviceType: orderDetails.formMainInfo.formTitle,
                serviceName: orderDetails.formMainInfo.formType,
              ),
              SizedBox(
                height: 24.h,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Ordered At ',
                            style: AppTextStyles.labelTextStyle,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            orderDetails.createdAt,
                            style: AppTextStyles.subTitleTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 2,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(8),
                        shrinkWrap: true,
                        itemCount: orderDetails.fields.length,
                        itemBuilder: (context, index) {
                          FieldValue field = orderDetails.fields[index];

                          return ListTile(
                            // leading: Text('ordered field'),
                            title: Text(
                              field.label ?? '',
                              style: AppTextStyles.title2TextStyle,
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  'Price : ',
                                  style: AppTextStyles.subTitleTextStyle,
                                ),
                                Text(
                                  '\$ ' + field.cost.toString(),
                                  style: AppTextStyles.title2TextStyle
                                      .copyWith(color: AppColors.primaryColor),
                                ),
                              ],
                            ),
                            trailing: SizedBox(
                              width: 120.w,
                              child: Wrap(
                                alignment: WrapAlignment.spaceAround,
                                  crossAxisAlignment: WrapCrossAlignment.end,
                                  spacing: 0,

                                  // mainAxisSize: MainAxisSize.min,
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Text(
                                    //   'Ordered value : ',
                                    //   style: AppTextStyles.subTitleTextStyle,
                                    // ),
                                    Text(
                                      field.value == 'true'
                                          ? 'checked'
                                          : field.value ?? '',
                                      style: AppTextStyles.title2TextStyle,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                            ),

                          );
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Divider(thickness: 2),
              SizedBox(
                height: 24.h,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Order Offers',
                            style: AppTextStyles.labelTextStyle,
                          ),
                          Icon(
                            Icons.local_offer_outlined,
                            size: 18.w,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            orderDetails.orderOffers.length.toString(),
                            style: AppTextStyles.labelTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 2,
                    ),
                    StatefulBuilder(
                      builder:(context,setState)=> ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(8),
                          shrinkWrap: true,
                          itemCount: orderDetails.orderOffers.length,
                          itemBuilder: (context, index) {
                            final offer = orderDetails.orderOffers[index];

                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                border: selectedOffer== offer.offerId ? Border.all(color: AppColors.primaryColor,width: 2): Border.all(color: AppColors.grey,width: 1)
                              ),
                              child: ListTile(
                                onTap: (){
                                  setState((){
                                    selectedOffer = offer.offerId;
                                  });
                                },
                                // selected: true,
                                // selectedColor: Colors.amber,
                                leading: CircleAvatar(
                                  radius: 22.r,
                                  backgroundColor: AppColors.primaryColor,
                                  child: CircleAvatar(
                                    radius: 20.r,
                                   backgroundColor: Colors.white,
                                    foregroundColor: AppColors.primaryColor,
                                    child: Icon(Iconsax.personalcard_copy,color: AppColors.primaryColor,),),
                                ),
                                title: Text(
                                  offer.worker.workerName ?? '',
                                  style: AppTextStyles.titleTextStyle,
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                subtitle: FittedBox(
                                  child: Row(
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          'worker offer : ',
                                          style: AppTextStyles.subTitleTextStyle,
                                        ),
                                      ),
                                      Text(
                                        offer.status,
                                        style: AppTextStyles.title2TextStyle,
                                      ),

                                    ],
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Offer price : ',
                                      style: AppTextStyles.subTitleTextStyle,
                                    ),
                                    Text(
                                      '\$ ' + offer.price.toString(),
                                      style: AppTextStyles.title2TextStyle
                                          .copyWith(color: AppColors.primaryColor),
                                    ),
                                  ],
                                ),
                                ),
                            );
                          },
                      separatorBuilder: (context,index){
                            return Column(children: [
                              SizedBox(height: 8.h,),
                              Divider(
                                indent: 20,
                                endIndent: 20,
                                thickness: 2,
                              ),
                              SizedBox(height: 8.h,),
                            ],);
                      },
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(
                height: 53.h,
              ),
              AppButton(
                  onTap: () {
                    context.navigateTo(
                        routeName: Routes.confirmOrderDetailsViewRoute);
                  },
                  buttonText: 'Next'),
              SizedBox(
                height: context.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
