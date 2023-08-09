import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/constants.dart';
import '../../../../assets/icons.dart';
import '../../../../assets/theme.dart';
import '../../../../core/bloc/show_pop_up/show_pop_up_bloc.dart';
import '../../../../core/ui_functions/bottom_sheet.dart';
import '../../../../core/ui_functions/dialog.dart';
import '../../../../core/widgets/text_field.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_scale.dart';
import '../../data/models/event_model.dart';
import '../bloc/calendar_bloc.dart';

class EditAnEventPage extends StatefulWidget {
  const EditAnEventPage({super.key, required this.model});
  final EventModel model;
  @override
  State<EditAnEventPage> createState() => _EditAnEventPageState();
}

class _EditAnEventPageState extends State<EditAnEventPage> {
  late final TextEditingController eventNameController;
  late final TextEditingController eventDescriptionController;
  late final TextEditingController eventLocationController;
  late int colorIndex;
  late String eventTime;

  bool get isEventEdited =>
      eventNameController.text != widget.model.name ||
      eventDescriptionController.text != widget.model.description ||
      eventLocationController.text != widget.model.location ||
      eventTime != widget.model.time ||
      colorIndex != widget.model.colorIndex;

  @override
  void initState() {
    final model = widget.model;
    eventNameController = TextEditingController(text: model.name);
    eventDescriptionController = TextEditingController(text: model.description);
    eventLocationController = TextEditingController(text: model.location);
    eventTime = model.time;
    colorIndex = model.colorIndex;

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
    if (isEventEdited) {
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
                                      onDateTimeChanged: (newdate) =>
                                          currentTimeAtPicker = newdate,
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
                  'Save',
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  if (eventNameController.text.isNotEmpty) {
                    if (isEventEdited) {
                      final EventModel newModel = EventModel(
                        id: widget.model.id,
                        day: widget.model.day,
                        name: eventNameController.text,
                        description: eventDescriptionController.text,
                        time: eventTime,
                        location: eventLocationController.text,
                        colorIndex: colorIndex,
                      );
                      context.read<CalendarBloc>().add(
                            CalendarEvent.editAnEvent(
                              newModel: newModel,
                              onFailure: (error) {
                                context.read<ShowPopUpBloc>().add(
                                    ShowPopUpEvent.showFailure(text: error));
                              },
                              onSuccess: () {
                                Navigator.pop(context);
                                context.read<ShowPopUpBloc>().add(
                                      ShowPopUpEvent.showSuccess(
                                          text: 'Event successfully edited 👌'),
                                    );
                              },
                            ),
                          );
                    } else {
                      Navigator.pop(context);
                      context.read<ShowPopUpBloc>().add(
                          ShowPopUpEvent.showWarning(text: 'No data changed'));
                    }
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
