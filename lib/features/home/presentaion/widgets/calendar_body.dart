import 'package:flutter/material.dart';
import 'package:udevs_task/assets/colors.dart';
import 'package:udevs_task/assets/constants.dart';
import '../home_page.dart';
import 'calendar_row_item.dart';

import '../../domain/entities/calendar_month.dart';

class WCalendarBody extends StatelessWidget {
  const WCalendarBody({
    super.key,
    required this.selectedMonth,
    required this.selectedDate,
    required this.selectDate,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;

  final ValueChanged<DateTime> selectDate;

  @override
  Widget build(BuildContext context) {
    var data = CalendarMonthData(
      year: selectedMonth.year,
      month: selectedMonth.month,
    );

    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                List.generate(AppConstants.daysOfWeekWords.length, (index) {
              final day = AppConstants.daysOfWeekWords[index];
              return Text(
                day,
                style: const TextStyle(
                  color: greyText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              );
            })),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var week in data.weeks)
              Row(
                children: week.map((d) {
                  return Expanded(
                    child: WCalendarRowItem(
                      hasRightBorder: false,
                      date: d.date,
                      isActiveMonth: d.isActiveMonth,
                      onTap: () => selectDate(d.date),
                      isSelected: selectedDate != null &&
                          selectedDate!.isSameDate(d.date),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ],
    );
  }
}
