import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/constants.dart';
import '../../../../assets/icons.dart';
import '../../../../core/bloc/show_pop_up/show_pop_up_bloc.dart';
import '../../../../core/ui_functions/bottom_sheet.dart';
import '../../../../core/ui_functions/dialog.dart';
import '../../../../core/widgets/text_field.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_scale.dart';
import '../../data/model/event_model.dart';
import '../bloc/calendar_bloc.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key, required this.selectedDate});
  final DateTime selectedDate;
  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  late final TextEditingController eventNameController;
  late final TextEditingController eventDescriptionController;
  late final TextEditingController eventLocationController;

  int colorIndex = 0;
  String eventTime = '';

  get isSomeDataEntered =>
      eventNameController.text.isNotEmpty ||
      eventDescriptionController.text.isNotEmpty ||
      eventLocationController.text.isNotEmpty ||
      eventTime.isNotEmpty;

  @override
  void initState() {
    eventNameController = TextEditingController();
    eventDescriptionController = TextEditingController();
    eventLocationController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    eventNameController.dispose();
    eventDescriptionController.dispose();
    eventLocationController.dispose();

    super.dispose();
  }

  Future<bool> willExit() async {
    if (isSomeDataEntered) {
      fShowDialog(
        context: context,
        content:
            const Text('Do you want to discard all the changes and exit? 😲'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text(
              'Yes',
              style: TextStyle(color: greyText),
            ),
          )
        ],
      );
      return false;
    }

    Navigator.pop(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willExit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  primary: true,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13, right: 19),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WScaleAnimation(
                          onTap: () => willExit(),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: SvgPicture.asset(
                              AppIcons.back,
                              alignment: Alignment.topLeft,
                            ),
                          ),
                        ),
                        WTextField(
                          title: 'Event name',
                          maxLength: 50,
                          controller: eventNameController,
                        ),
                        WTextField(
                          title: 'Event description',
                          textInputAction: TextInputAction.newline,
                          controller: eventDescriptionController,
                          maxLines: 6,
                        ),
                        WTextField(
                          title: 'Event location',
                          maxLength: 40,
                          controller: eventLocationController,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: colorIndex,
                            items:
                                AppConstants.todoLightColors.map((Color color) {
                              return DropdownMenuItem<int>(
                                value:
                                    AppConstants.todoLightColors.indexOf(color),
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  color: color,
                                ),
                              );
                            }).toList(),
                            onChanged: (selectedColorIndex) {
                              if (selectedColorIndex != null) {
                                colorIndex = selectedColorIndex;
                                setState(() {});
                              }
                            },
                          ),
                        ),
                        WTextField(
                          title: 'Event time',
                          isReadOnly: true,
                          onTap: () {
                            DateTime currentTimeAtPicker = (eventTime.isEmpty)
                                ? DateTime.now()
                                : DateTime.now().copyWith(
                                    hour: int.parse(eventTime.substring(0, 2)),
                                    minute: int.parse(eventTime.substring(3)),
                                  );
                            fShowBottomSheet(
                                context: context,
                                onTapButton: () {
                                  final hour = currentTimeAtPicker.hour < 10
                                      ? '0${currentTimeAtPicker.hour}'
                                      : currentTimeAtPicker.hour.toString();
                                  final min = currentTimeAtPicker.minute < 10
                                      ? '0${currentTimeAtPicker.minute}'
                                      : currentTimeAtPicker.minute.toString();
                                  eventTime = '$hour:$min';
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height /
                                        3,
                                    child: CupertinoDatePicker(
                                      initialDateTime: currentTimeAtPicker,
                                      onDateTimeChanged: (newDate) =>
                                          currentTimeAtPicker = newDate,
                                      use24hFormat: true,
                                      mode: CupertinoDatePickerMode.time,
                                    ),
                                  ),
                                ]);
                          },
                          controller: TextEditingController(text: eventTime),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              WButton(
                margin: const EdgeInsets.all(16),
                height: 45,
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  if (eventNameController.text.isNotEmpty) {
                    final EventModel model = EventModel(
                      day: widget.selectedDate.toIso8601String(),
                      name: eventNameController.text,
                      description: eventDescriptionController.text,
                      time: eventTime,
                      location: eventLocationController.text,
                      colorIndex: colorIndex,
                    );
                    context.read<CalendarBloc>().add(
                          CalendarEvent.addNewEvent(
                            model: model,
                            onFailure: (error) {
                              context
                                  .read<ShowPopUpBloc>()
                                  .add(ShowPopUpEvent.showFailure(text: error));
                            },
                            onSuccess: () {
                              Navigator.pop(context);
                              context.read<ShowPopUpBloc>().add(
                                    ShowPopUpEvent.showSuccess(
                                        text:
                                            'New event successfully added 👌'),
                                  );
                            },
                          ),
                        );
                  } else {
                    context.read<ShowPopUpBloc>().add(
                          ShowPopUpEvent.showWarning(
                              text: 'Event name should not be empty'),
                        );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
