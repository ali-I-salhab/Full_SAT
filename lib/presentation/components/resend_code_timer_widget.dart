import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/auth/auth_cubit.dart';

class ResendCodeTimerWidget extends StatefulWidget {
  const ResendCodeTimerWidget({super.key, required this.phone});

  final String phone;

  @override
  State<ResendCodeTimerWidget> createState() {
    return _ResendCodeTimerWidgetState();
  }
}

class _ResendCodeTimerWidgetState extends State<ResendCodeTimerWidget> {
  int secondsRemaining = 60;
  bool enableResend = false;
  late Timer _timer;

  @override
  initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        enableResend == false
            ? Text('$secondsRemaining seconds')
            : const Text('1 min'),
        InkWell(
            onTap: enableResend
                ? () async {
                    setState(() {
                      secondsRemaining = 60;
                      enableResend = false;
                    });
                    context.read<AuthCubit>().sendOTP(widget.phone);
                  }
                : null,
            // child: state is AuthEnableResendCodeState
            child: enableResend == true
                ? const Text(
                    'send again',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                : const Text(
                    'send again',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
      ],
    );
  }
}
