import 'package:flutter/material.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/long_centered_text.dart';

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Image.asset('assets/images/waiting_images/waiting_1.png'),
        ),
        LongCenteredText(text: 'order_status.please_wait_It_wont_be_long'.tr(context)),
      ],
    );
  }
}
