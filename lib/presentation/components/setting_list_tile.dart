import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({super.key,required this.icon,required this.title,this.trailing,this.onTap});
  final IconData icon;
  final String title;
  final Widget? trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 1.h),
      tileColor: Colors.white,
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing ?? Icon( Icons.arrow_forward_ios_outlined),
    );
  }
}
