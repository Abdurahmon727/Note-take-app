import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/icons.dart';
import '../../../../core/app_functions.dart';
import '../../../../core/ui_functions/bottom_sheet.dart';
import '../../../../core/widgets/w_scale.dart';
import '../bloc/calendar_bloc.dart';

class WHomeAppBar extends StatelessWidget {
  const WHomeAppBar({
    super.key,
    required this.selectedDate,
  });
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 10, 28, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(width: 28),
          WScaleAnimation(
            onTap: () {
              DateTime selectedDate = DateTime.now();
              fShowBottomSheet(
                  context: context,
                  buttonTitle: 'Go',
                  onTapButton: () {
                    Navigator.pop(context);
                    context
                        .read<CalendarBloc>()
                        .add(CalendarEvent.changeSelectedMonth(selectedDate));
                    context
                        .read<CalendarBloc>()
                        .add(CalendarEvent.changeSelectedDate(selectedDate));
                  },
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).copyWith().size.height / 3,
                      child: CupertinoDatePicker(
                        maximumDate: DateTime(2950),
                        minimumDate: DateTime(1950),
                        initialDateTime:
                            context.read<CalendarBloc>().state.selectedDate,
                        onDateTimeChanged: (newdate) => selectedDate = newdate,
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.date,
                      ),
                    )
                  ]);
            },
            child: Column(
              children: [
                Text(
                  AppFunctions.getDayOfWeek(selectedDate.weekday),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '${selectedDate.day} ${AppFunctions.getMonth(selectedDate.month)} ${selectedDate.year}',
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset(AppIcons.bottomArrow)
                  ],
                ),
              ],
            ),
          ),
          // WScaleAnimation(
          //   onTap: () {
          //     //TODO
          //   },
          //   child: SvgPicture.asset(AppIcons.ring),
          // ),
        ],
      ),
    );
  }
}
