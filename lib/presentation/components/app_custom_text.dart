import 'package:flutter/cupertino.dart';

class AppCustomText extends StatelessWidget {
  const AppCustomText({super.key,required this.data,required this.style});
  final String data;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(data,style: style,)),
    );
  }
}
