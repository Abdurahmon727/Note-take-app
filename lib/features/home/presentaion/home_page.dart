import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assets/icons.dart';
import '../../../core/app_functions.dart';
import '../../../core/widgets/w_scale.dart';
import 'widgets/calendar_body.dart';
import 'widgets/calendar_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime selectedMonth;
  late DateTime currentTime;

  DateTime? selectedDate;

  @override
  void initState() {
    currentTime = DateTime.now();
    selectedMonth = DateTime.now().monthStart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 28),
                Column(
                  children: [
                    Text(
                      AppFunctions.getDayOfWeek(currentTime.weekday),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${currentTime.day} ${AppFunctions.getMonth(currentTime.month)} ${currentTime.year}',
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                WScaleAnimation(
                    onTap: () {
                      //TODO
                    },
                    child: SvgPicture.asset(AppIcons.ring)),
              ],
            ),
            SizedBox(
              height: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WCalendarHeader(
                    selectedMonth: selectedMonth,
                    onChange: (value) => setState(() => selectedMonth = value),
                  ),
                  Expanded(
                    child: WCalendarBody(
                      selectedDate: selectedDate,
                      selectedMonth: selectedMonth,
                      selectDate: (DateTime value) => setState(() {
                        selectedDate = value;
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension DateTimeExt on DateTime {
  DateTime get monthStart => DateTime(year, month);
  DateTime get dayStart => DateTime(year, month, day);

  DateTime addMonth(int count) {
    return DateTime(year, month + count, day);
  }

  bool isSameDate(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  bool get isToday {
    return isSameDate(DateTime.now());
  }
}
