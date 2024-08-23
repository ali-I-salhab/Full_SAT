import 'package:flutter/material.dart';

class AppLogoContainer extends StatelessWidget {
  const AppLogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const              Image(
        image: ResizeImage(
            AssetImage('assets/images/osta_logo.png'),
            width: 300, height: 300));
  }
}
