// import 'package:flutter/material.dart';
// import 'package:udevs_task/core/widgets/w_scale.dart';

// import '../../assets/icons.dart';

// class WCheckBox extends StatelessWidget {
//   const WCheckBox({
//     Key? key,
//     required this.value,
//     this.borderRadius = 6,
//     required this.onPressed,
//     this.activeColor = badgeBackgroundColor,
//   }) : super(key: key);

//   final bool value;
//   final double borderRadius;
//   final VoidCallback onPressed;
//   final Color activeColor;

//   @override
//   Widget build(BuildContext context) {
//     return WScaleAnimation(
//       onTap: onPressed,
//       child: Container(
//         padding: const EdgeInsets.only(
//           top: 6,
//           bottom: 5,
//           right: 4,
//           left: 4,
//         ),
//         decoration: BoxDecoration(
//           border: Border.all(color: activeColor),
//           borderRadius: BorderRadius.circular(borderRadius),
//           color: value ? activeColor : null,
//         ),
//         height: 18,
//         width: 17,
//         child: value ? SvgPicture.asset(AppIcons.checkTrue) : null,
//       ),
//     );
//   }
// }
