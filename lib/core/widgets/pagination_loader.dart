// import 'package:flutter/cupertino.dart';

// class PaginationLoader extends StatelessWidget {
//   final ScrollPhysics? scrollPhysics;
//   final EdgeInsets? margin;
//   final EdgeInsets? padding;
//   final List<dynamic> list;
//   final int totalPages;
//   final int currentPage;
//   final bool isLoading;
//   final VoidCallback onLoadMore;
//   final double seperatorHeight;
//   final bool isFailedToLoad;
//   const PaginationLoader({
//     required this.list,
//     required this.onLoadMore,
//     required this.isLoading,
//     required this.currentPage,
//     required this.totalPages,
//     required this.isFailedToLoad,
//     this.seperatorHeight = 0,
//     this.scrollPhysics,
//     this.padding,
//     this.margin,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Container(
//         margin: margin,
//         child: SingleChildScrollView(
//           padding: padding,
//           physics: scrollPhysics,
//           child: Column(
//             children: [
//               ...List.generate(
//                 list.length,
//                 (index) => Container(
//                   padding: EdgeInsets.only(bottom: seperatorHeight),
//                   child: list[index],
//                 ),
//               ),
//               // ...list,
//               if (totalPages > currentPage)
//                 VisibilityDetector(
//                   key: const Key('my-key'),
//                   onVisibilityChanged: (visibilityInfo) {
//                     final visibilityPercentage =
//                         visibilityInfo.visibleFraction * 100;
//                     if (visibilityPercentage == 100) {
//                       onLoadMore();
//                     }
//                   },
//                   child: !isFailedToLoad
//                       ? const SpinKitThreeBounce(size: 20, color: black)
//                       : const SizedBox(),
//                 )
//               else
//                 const SizedBox()
//             ],
//           ),
//         ),
//       );
// }
