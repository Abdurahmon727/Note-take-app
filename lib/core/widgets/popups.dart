// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:udevs_task/core/widgets/w_scale.dart';

// class PopUp extends StatelessWidget {
//   //bottomSheet in TaskScreen
//   static void showFilter(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) => SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.only(
//             top: 16,
//             bottom: 32,
//             left: 22,
//             right: 22,
//           ),
//           height: 230,
//           color: scaffoldBackgroundColor,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   const Text(
//                     'Filter',
//                     style: TextStyle(
//                       color: Colors.white, //TODO It will change
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const Spacer(),
//                   WScaleAnimation(
//                     child: SvgPicture.asset(
//                       AppIcons.cancel,
//                     ),
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               BottomWidget(
//                 leadingIcon: SvgPicture.asset(AppIcons.sort),
//                 title: 'Sort',
//                 text: 'A-Z',
//               ),
//               const SizedBox(
//                 height: 26,
//                 width: double.infinity,
//                 child: Divider(
//                   thickness: 1,
//                   color: Color(
//                     0xFFFEFEFE,
//                   ),
//                 ),
//               ),
//               BottomWidget(
//                 leadingIcon: SvgPicture.asset(AppIcons.date),
//                 title: 'Date',
//                 text: 'Recent first',
//               ),
//               const SizedBox(
//                 height: 26,
//                 width: double.infinity,
//                 child: Divider(thickness: 1, color: Color(0xFFFEFEFE)),
//               ),
//               BottomWidget(
//                 leadingIcon: SvgPicture.asset(AppIcons.priority),
//                 title: 'Priority',
//                 text: 'High',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   final String _message;
//   final String _icon;
//   final Color _color;
//   final GlobalKey _globalKey;
//   final bool _showPopUp;
//   const PopUp({
//     required GlobalKey globalKey,
//     required String icon,
//     required Color color,
//     required String messageText,
//     required bool showPopUp,
//     Key? key,
//   })  : _message = messageText,
//         _icon = icon,
//         _color = color,
//         _globalKey = globalKey,
//         _showPopUp = showPopUp,
//         super(key: key);
//   const PopUp.warning({
//     required GlobalKey globalKey,
//     String warningMessage = '',
//     required bool showPopUp,
//     Key? key,
//   })  : _message = warningMessage,
//         _globalKey = globalKey,
//         _color = white,
//         _icon = AppIcons.error,
//         _showPopUp = showPopUp,
//         super(key: key);
//   const PopUp.error({
//     required GlobalKey globalKey,
//     String errorMessage = '',
//     required bool showPopUp,
//     Key? key,
//   })  : _message = errorMessage,
//         _globalKey = globalKey,
//         _color = white,
//         _icon = AppIcons.error,
//         _showPopUp = showPopUp,
//         super(key: key);
//   const PopUp.success({
//     required GlobalKey globalKey,
//     String successMessage = '',
//     required bool showPopUp,
//     Key? key,
//   })  : _message = successMessage,
//         _globalKey = globalKey,
//         _showPopUp = showPopUp,
//         _color = Colors.green,
//         _icon = AppIcons.success,
//         super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedPositioned(
//       left: 16,
//       right: 16,
//       top: _showPopUp
//           ? 50
//           : _globalKey.currentContext != null
//               ? -(_globalKey.currentContext!.findRenderObject() as RenderBox)
//                   .size
//                   .height
//               : -62,
//       duration: const Duration(milliseconds: 200),
//       child: Container(
//         key: _globalKey,
//         decoration: BoxDecoration(
//           color: _color,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               offset: const Offset(0, 1),
//               blurRadius: 4,
//               color: black.withOpacity(0.12),
//             )
//           ],
//         ),
//         padding: const EdgeInsets.fromLTRB(16, 8, 12, 8),
//         child: Material(
//           color: Colors.transparent,
//           child: Row(
//             children: [
//               WScaleAnimation(
//                 onTap: () {
//                   context.read<ShowPopUpBloc>().add(ShowPopUpEvent.hide());
//                 },
//                 child: SvgPicture.asset(_icon),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Text(
//                   _message,
//                   style: Theme.of(context)
//                       .textTheme
//                       .subtitle1!
//                       .copyWith(fontSize: 12, color: white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
