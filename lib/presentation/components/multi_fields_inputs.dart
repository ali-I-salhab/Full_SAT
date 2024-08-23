import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/field_info.dart';
import 'package:osta/logic/main_cubit/main_cubit.dart';
import 'package:osta/presentation/components/app_text_field.dart';

class MultiFieldsInput extends StatelessWidget {
   MultiFieldsInput({super.key,required this.field});
 final FieldInfo field;

 final TextEditingController fieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> fieldValues = context.read<MainCubit>().multipleFieldValues;
    return StatefulBuilder(
      builder:(context,setState)=> Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppTextField(
                width: 306.w,
                inputType:TextInputType.text,
                labelText: field.placeholder,
                controller: fieldController,
                onFieldSubmit: (value) {
                  // setState(() {
                  //   fieldValues.add(value);
                  //   context
                  //     .read<MainCubit>()
                  //     .userInputs[field.name]?['value'] = fieldValues;
                  // }
                  // );
                  print(value);
                },
                validator: (value){
    if(field.validation != null && field.validation!.contains('required')) {
    if ( fieldValues.isEmpty) {
    return 'This field is required';
    }
    }
    return null;
                },
              ),

              IconButton(onPressed: () {
                if(fieldController.text.isNotEmpty)
                setState((){
                  fieldValues.add(fieldController.text);
                  context
                      .read<MainCubit>()
                      .userInputs[field.name]!.update("value", (value) => fieldValues);
                  // ?['value'] = fieldValues;
                  fieldController.clear();
                });
              }, icon: Icon(Icons.add_circle, size: 28.w,))
            ],),


      //     Expanded(
      //       flex: 1,
      //       child:
      // //   ResponsiveBuilder(
      // //   builder: (context, sizingInformation) {
      // //               return
      //   GridView.builder(
      //         physics: NeverScrollableScrollPhysics(),
      //               shrinkWrap: true,
      //               gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      // childAspectRatio: 120.w/100.h,
      // mainAxisExtent: 50.w,
      // // crossAxisCount:4,
      // //                 crossAxisCount: (sizingInformation.localWidgetSize.width
      // //                     / 350 ).round(),
      // crossAxisSpacing: 1,
      // mainAxisSpacing: 1, maxCrossAxisExtent: 50.w,
      // ),
      //               padding: EdgeInsets.zero,
      //
      //               itemCount: fieldValues.length,
      //               itemBuilder: (context,index){
      //       }
      //       )
      //             // }
      //           ),


          Wrap(children:
          fieldValues.map((e) {
            return Stack(

              children: [
                Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.white,width: 1.w,),
                    ),
                    height: 40.h,
                    // width:70.w,
                    // width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    margin: EdgeInsets.symmetric( horizontal: 4.w,vertical: 4.w),
                    child:
                    IntrinsicWidth(
                      child: Center(child: Text(e,style: AppTextStyles.title2TextStyle.copyWith(
                          color: Colors.white
                      ),),),
                    )
                ),

                // Align(
                Positioned(
                    top: -15.h,
                    right: -15.h,
                    // alignment: AlignmentDirectional.topStart,
                    child:
                    IconButton(onPressed: (){
                      setState((){
                        fieldValues.remove(e);
                        context
                            .read<MainCubit>()
                            .userInputs[field.name]!.update("value", (value) => fieldValues);
                        // context
                        //     .read<MainCubit>()
                        //     .userInputs[field.name]?['value'] = fieldValues;
                      });
                    },icon: Icon(Icons.cancel,color: Colors.white,),)
                ),
              ],
            );

          }
          ).toList()

            ,)
        ],
      ),
    );
  }
}
