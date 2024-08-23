import 'package:flutter/material.dart';

enum AppToastType {
  success,
  warning,
  error,
}

SnackBar appToast({
  required String text,
  required AppToastType type,
  required BuildContext context,
  Function? onTap,
  int duration = 3,
}) {

  return SnackBar(
    content: Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 16, color: Colors.white,
          ),
        ),),
        InkWell(
          onTap: () {
            if (onTap != null) onTap();
          },
          child: Icon(
            type == AppToastType.error
                ? Icons.clear
                : type == AppToastType.success
                    ? Icons.check
                    : Icons.warning_rounded,
            color: type == AppToastType.error
                ? Colors.red[400]
                : type == AppToastType.success
                ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onError
            // : Colors.orange[500];,
          ),
        ),
      ],
    ),
    backgroundColor: Theme.of(context).colorScheme.surface,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(20),
    duration: Duration(seconds: duration),
  );
}
