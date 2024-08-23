import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoRow extends StatelessWidget {
  const ProfileInfoRow({super.key, required this.icon ,required this.info});
  final IconData icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return    ListTile(
      tileColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 2.h),
      leading: Icon(icon,size: 24.w),
      title: Text(info),
      // mainAxisAlignment: MainAxisAlignment.start,
      // children: [
      //   Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //     child: Icon(icon),
      //   ),
      //   Text(info)
      // ],
    );
  }
}
