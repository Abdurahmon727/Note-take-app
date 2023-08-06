import 'package:flutter/material.dart';
import '../home_page.dart';

import 'calendar_body.dart';
import 'calendar_header.dart';

class WCalendar extends StatefulWidget {
  const WCalendar({super.key});

  @override
  State<WCalendar> createState() => _WCalendarState();
}

class _WCalendarState extends State<WCalendar> {
  late DateTime selectedMonth;

  @override
  void initState() {
    selectedMonth = DateTime.now().monthStart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WCalendarHeader(
            selectedMonth: selectedMonth,
            onChange: (value) => setState(() => selectedMonth = value),
          ),
          Expanded(
            child: WCalendarBody(
              selectedMonth: selectedMonth,
              selectDate: (DateTime value) {
                //TODO
              },
            ),
          ),
        ],
      ),
    );
  }
}
