import 'package:flutter/material.dart';

// void showErrorSnakBar(context, text) {
//   var snackBar = SnackBar(
//       backgroundColor: Colors.redAccent,
//       elevation: 2,
//       duration: const Duration(seconds: 1),
//       content: Text(
//         text,
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//       ));
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }


class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    required String title,
    IconData icon = Icons.warning_rounded,
    Color backgroundColor = Colors.red,
    bool showCloseIcon = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        content: Row(
          children: <Widget>[
            Icon(icon, color: Colors.white, size: 40),
            SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    message,
                    style:
                    TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        dismissDirection: DismissDirection.horizontal,
        showCloseIcon: showCloseIcon,
        closeIconColor: Colors.white,
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
