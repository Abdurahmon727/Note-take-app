import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/icons.dart';
import '../../../../core/app_functions.dart';
import '../../../../core/widgets/w_scale.dart';

class WHomeBar extends StatelessWidget {
  const WHomeBar({
    super.key,
    required this.selectedDate,
  });
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 28),
          Column(
            children: [
              Text(
                AppFunctions.getDayOfWeek(selectedDate.weekday),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Text(
                '${selectedDate.day} ${AppFunctions.getMonth(selectedDate.month)} ${selectedDate.year}',
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          WScaleAnimation(
            onTap: () {
              //TODO
            },
            child: SvgPicture.asset(AppIcons.ring),
          ),
        ],
      ),
    );
  }
}
