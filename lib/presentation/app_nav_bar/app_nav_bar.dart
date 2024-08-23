// import 'package:flutter/material.dart';
// import 'package:osta/presentation/app_nav_bar/custom_paint.dart';
//
// class AppNavBar extends StatefulWidget {
//   const AppNavBar({super.key,required this.items,required this.onTap});
//   final List<Icon> items;
//   final Function(int) onTap;
//
//   @override
//   State<AppNavBar> createState() => _AppNavBarState();
// }
//
// class _AppNavBarState extends State<AppNavBar> {
//   int selectBtn = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       height: 70.0,
//       duration: const Duration(milliseconds: 400),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(selectBtn == 0 ? 0.0 : 20.0),
//           topRight:
//           Radius.circular(selectBtn == widget.items.length - 1 ? 0.0 : 20.0),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           for (int i = 0; i < widget.items.length; i++)
//             GestureDetector(
//               onTap:()=> widget.onTap(i),
//               child: iconBtn(i),
//             ),
//         ],
//       ),
//     );
//   }
//
//   SizedBox iconBtn(int i) {
//     bool isActive = selectBtn == i ? true : false;
//     var height = isActive ? 60.0 : 0.0;
//     var width = isActive ? 50.0 : 0.0;
//     return SizedBox(
//       width: 75.0,
//       child: Stack(
//         children: [
//           Align(
//             alignment: Alignment.topCenter,
//             child: AnimatedContainer(
//               height: height,
//               width: width,
//               duration: const Duration(milliseconds: 600),
//               child: isActive
//                   ? CustomPaint(
//                 painter: NavCustomPainter(),
//               )
//                   : const SizedBox(),
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: widget.items[i],
//             // Image.asset(
//             //   .imagePath,
//             //   color: isActive ? selectColor : black,
//             //   scale: 2,
//             // ),
//           ),
//           // Align(
//           //   alignment: Alignment.bottomCenter,
//           //   child: Text(
//           //     navBtn[i].name,
//           //     style: isActive ? bntText.copyWith(color: selectColor) : bntText,
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }
