import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/user_model.dart';
import 'package:osta/logic/location/location_cubit.dart';
import 'package:osta/presentation/router/routes.dart';

class ProfileMainInfoCard extends StatelessWidget {
  ProfileMainInfoCard({super.key, this.isProfilePage,this.profileImage,this.user});
  bool? isProfilePage = false ;
  String? profileImage;
  UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
             borderRadius: BorderRadius.circular(100.r),
            child: profileImage!=null?
            // CachedNetworkImage(
            // imageUrl: profileImage!,
            Image.network(profileImage!,
                // headers: ,
                // loadingBuilder: (),
                height: 110.h,
              width: 110.w,fit:BoxFit.cover)
                : Image.asset(
              'assets/images/profile.png',
            fit: BoxFit.cover,
            height: 110.h,
              width: 110.w,
            ),
          ),
          SizedBox(height: 12.h,),
          Center(child: Text(user?.name ?? 'username',style: AppTextStyles.title5TextStyle,),),
        // isProfilePage  == true ?  Center(
        //     child: TextButton(
        //         onPressed: ()async{
        //           context.navigateTo(routeName: Routes.profileConfigViewRoute,arguments: user);
        //         await  context.read<LocationCubit>().getAddresses();
        //         }, child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         CircleAvatar(
        //           radius: 12.r,
        //             backgroundColor: Theme.of(context).primaryColor,
        //             child: Icon(Icons.edit,color: Colors.white,size: 12.h,)),
        //         Padding(
        //           padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
        //           child: Text('Edit profile',style: AppTextStyles.editTextStyle,),
        //         )
        //       ],
        //     )),
        //   )
        //     : Container()
        ],
      ),
    );
  }
}
