// import 'package:flutter/material.dart';
// import 'package:udevs_task/core/widgets/w_scale.dart';

// import '../../assets/colors.dart';
// import '../../assets/icons.dart';

// class WBottomSheet extends StatelessWidget {
//   final double borderRadius;
//   final List<Widget> children;
//   final List<Widget>? headerChildren;
//   final Widget? bottomNavigation;
//   final double? height;
//   final EdgeInsets? contentPadding;
//   final EdgeInsets? bottomNavigationPadding;
//   final bool isScrollable;
//   final bool isTitledBottomSheet;
//   final String title;

//   const WBottomSheet({
//     required this.children,
//     this.borderRadius = 12,
//     this.isScrollable = false,
//     this.height,
//     this.bottomNavigation,
//     this.contentPadding,
//     this.headerChildren,
//     this.bottomNavigationPadding,
//     this.isTitledBottomSheet = false,
//     this.title = '',
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Padding(
//         padding:
//             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               clipBehavior: Clip.hardEdge,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(borderRadius),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: isTitledBottomSheet
//                         ? MainAxisAlignment.start
//                         : MainAxisAlignment.spaceBetween,
//                     children: [
//                       if (!isTitledBottomSheet) ...{
//                         const SizedBox(width: 64),
//                         Container(
//                           height: 4,
//                           width: 80,
//                           decoration: BoxDecoration(
//                             color: white.withOpacity(0.4),
//                             borderRadius: BorderRadius.circular(24),
//                           ),
//                         ),
//                       } else ...{
//                         const SizedBox(width: 20),
//                         Expanded(
//                           child: Text(
//                             title,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style:
//                                 Theme.of(context).textTheme.headline1!.copyWith(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                           ),
//                         ),
//                       },
//                       WScaleAnimation(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 8,
//                           ),
//                           child: SvgPicture.asset(AppIcons.close),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     padding: contentPadding ??
//                         EdgeInsets.fromLTRB(
//                           16,
//                           16,
//                           16,
//                           MediaQuery.of(context).padding.bottom + 16,
//                         ),
//                     child: isScrollable
//                         ? SingleChildScrollView(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: children,
//                             ),
//                           )
//                         : Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.min,
//                             children: children,
//                           ),
//                   ),
//                 ],
//               ),
//             ),
//             if (bottomNavigation != null) ...{
//               Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   border: Border(
//                     top: BorderSide(width: 1, color: Color(0XFFF4F4F4)),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: bottomNavigationPadding ??
//                       EdgeInsets.only(
//                         top: 20,
//                         left: 16,
//                         right: 16,
//                         bottom: MediaQuery.of(context).padding.bottom + 20,
//                       ),
//                   child: bottomNavigation,
//                 ),
//               ),
//             }
//           ],
//         ),
//       );
// }
