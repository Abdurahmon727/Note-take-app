import 'package:flutter/material.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/constants.dart';
import '../../../../core/data/service_locator.dart';
import '../../../../core/extensions/date_time.dart';
import '../../domain/repositories/home_repo.dart';

class WCalendarItem extends StatelessWidget {
  const WCalendarItem({
    super.key,
    required this.isActiveMonth,
    required this.isSelected,
    required this.date,
    required this.onTap,
  });

  final bool isActiveMonth;
  final VoidCallback onTap;
  final bool isSelected;

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final int number = date.day;
    final isToday = date.isToday;
    final bool isPassed = date.isBefore(DateTime.now().dayStart);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 25,
            width: 25,
            decoration: isSelected
                ? const BoxDecoration(color: blue, shape: BoxShape.circle)
                : isToday
                    ? BoxDecoration(
                        border: Border.all(color: red),
                        borderRadius: BorderRadius.circular(30),
                      )
                    : null,
            child: Text(
              number.toString(),
              style: TextStyle(
                fontSize: 14,
                color: isSelected
                    ? white
                    : isPassed
                        ? isActiveMonth
                            ? greyText
                            : Colors.transparent
                        : isActiveMonth
                            ? null
                            : greyText,
              ),
            ),
          ),
          const SizedBox(height: 3),
          FutureBuilder(
            future: sl<HomeRepository>().getFirst3EventsColorIndexes(date.toIso8601String()),
            builder: (context, snapShot) {
              if (snapShot.hasData && snapShot.data!.isRight) {
                final colorIndexes = snapShot.data!.right;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      colorIndexes.length,
                      (i) => Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          color: AppConstants.todoLightColors[colorIndexes[i]],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
