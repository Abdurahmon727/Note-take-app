import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udevs_task/features/home/presentaion/home_page.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';
import '../../../../core/app_functions.dart';
import '../../../../core/widgets/w_button.dart';

class WCalendarHeader extends StatelessWidget {
  const WCalendarHeader({
    super.key,
    required this.selectedMonth,
    required this.onChange,
  });

  final DateTime selectedMonth;

  final ValueChanged<DateTime> onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                AppFunctions.getMonth(selectedMonth.month),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              WButton(
                height: 24,
                width: 24,
                onTap: () {
                  onChange(selectedMonth.addMonth(-1));
                },
                color: grey,
                borderRadius: 30,
                child: SvgPicture.asset(AppIcons.arrowLeft),
              ),
              const SizedBox(width: 10),
              WButton(
                height: 24,
                width: 24,
                onTap: () {
                  onChange(selectedMonth.addMonth(1));
                },
                color: grey,
                borderRadius: 30,
                child: SvgPicture.asset(AppIcons.arrowRight),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
