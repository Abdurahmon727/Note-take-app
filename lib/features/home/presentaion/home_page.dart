import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets/colors.dart';
import '../../../core/bloc/show_pop_up/show_pop_up_bloc.dart';
import '../../../core/models/formz/formz_status.dart';
import '../../../core/navigator.dart';
import '../../../core/widgets/w_button.dart';
import 'bloc/calendar_bloc.dart';
import 'pages/add_event_page.dart';
import 'widgets/calendar_body.dart';
import 'widgets/calendar_header.dart';
import 'widgets/event_preview.dart';
import 'widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) {
            if (state.selectedMonth == null) {
              return const Center(child: CircularProgressIndicator());
            }
            final selectedMonth = state.selectedMonth!;
            final selectedDate = state.selectedDate;
            return Column(
              children: [
                WHomeAppBar(selectedDate: selectedDate ?? DateTime.now()),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    children: [
                      SizedBox(
                        height: 320,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WCalendarHeader(
                                selectedMonth: selectedMonth,
                                onChange: (value) => context
                                    .read<CalendarBloc>()
                                    .add(CalendarEvent.changeSelectedMonth(
                                        value))),
                            WCalendarBody(
                              selectedDate: selectedDate,
                              selectedMonth: selectedMonth,
                              selectDate: (value) => context
                                  .read<CalendarBloc>()
                                  .add(CalendarEvent.changeSelectedDate(value)),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Schedule',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          WButton(
                            borderRadius: 10,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            height: 30,
                            color: blue,
                            onTap: () {
                              if (selectedDate != null) {
                                Navigator.push(
                                  context,
                                  cupertino(
                                      page: AddEventPage(
                                          selectedDate: selectedDate)),
                                );
                              } else {
                                context.read<ShowPopUpBloc>().add(
                                    ShowPopUpEvent.showWarning(
                                        text:
                                            'Please choose a day to create an event'));
                              }
                            },
                            child: const Text(
                              '+ Add Event',
                              style: TextStyle(
                                color: white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Builder(builder: (context) {
                        return () {
                          if (state.status == FormzStatus.submissionSuccess) {
                            final models = state.models;
                            if (models.isEmpty) {
                              return const Center(
                                  child:
                                      Text('No Events found for this day 🤫'));
                            } else {
                              return ListView.separated(
                                itemCount: models.length,
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (context, index) {
                                  return WEventPreview(
                                      model: models[index], index: index);
                                },
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 14),
                              );
                            }
                          } else if (state.status ==
                              FormzStatus.submissionInProgress) {
                            return const Center(
                                child: CircularProgressIndicator(color: blue));
                          } else if (state.status == FormzStatus.pure) {
                            return const Center(
                              child: Text('Welcome  🥳 '),
                            );
                          }
                          return const SizedBox();
                        }();
                      }),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
