import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/icons.dart';
import '../../../../core/app_functions.dart';
import '../../../../core/widgets/w_scale.dart';

class WHomeBar extends StatefulWidget {
  const WHomeBar({
    super.key,
  });

  @override
  State<WHomeBar> createState() => _WHomeBarState();
}

class _WHomeBarState extends State<WHomeBar> {
  late final DateTime currentTime;

  @override
  void initState() {
    currentTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 28),
        Column(
          children: [
            Text(
              AppFunctions.getDayOfWeek(currentTime.weekday),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              '${currentTime.day} ${AppFunctions.getMonth(currentTime.month)} ${currentTime.year}',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        WScaleAnimation(
            onTap: () {
              //TODO
            },
            child: SvgPicture.asset(AppIcons.ring)),
      ],
    );
  }
}
