import 'package:flutter/material.dart';

void wShowDialog({
  required BuildContext context,
  required Widget content,
  required List<Widget> actions,
}) {
  showGeneralDialog(
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    barrierDismissible: true,
    barrierLabel: 's',
    transitionBuilder: (context, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: AlertDialog(
          actionsPadding: const EdgeInsets.all(4),
          content: content,
          actions: actions,
        ),
      );
    },
  );
}
