import 'package:flutter/material.dart';

import '../../../../assets/colors.dart';
import '../home_page.dart';

class WCalendarItem extends StatelessWidget {
  const WCalendarItem({
    super.key,
    required this.hasRightBorder,
    required this.isActiveMonth,
    required this.date,
    required this.onTap,
  });

  final bool hasRightBorder;
  final bool isActiveMonth;
  final VoidCallback onTap;

  final DateTime date;
  @override
  Widget build(BuildContext context) {
    final int number = date.day;
    final isToday = date.isToday;
    final bool isPassed = date.isBefore(DateTime.now());

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 25,
            width: 25,
            decoration: isToday
                ? BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(30),
                  )
                : null,
            child: Text(
              number.toString(),
              style: TextStyle(
                  fontSize: 14,
                  color: isToday
                      ? white
                      : isPassed
                          ? isActiveMonth
                              ? greyText
                              : Colors.transparent
                          : isActiveMonth
                              ? null
                              : greyText),
            ),
          ),
          const SizedBox(height: 3),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Container(
          //       height: 4,
          //       width: 4,
          //       decoration:
          //           const BoxDecoration(color: red, shape: BoxShape.circle),
          //     )
          //   ],
          // ),
          const SizedBox(height: 3),
        ],
      ),
    );
  }
}
