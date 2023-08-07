import 'package:flutter/material.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/constants.dart';
import '../../../../core/data/date_time.dart';
import '../../domain/entities/calendar_month.dart';
import 'calendar_item.dart';

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
            for (final week in data.weeks)
              Row(
                children: week.map((d) {
                  return Expanded(
                    child: WCalendarItem(
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
