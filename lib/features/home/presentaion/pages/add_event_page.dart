import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udevs_task/assets/constants.dart';
import '../../../../assets/icons.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_scale.dart';

import '../../../../assets/colors.dart';
import '../../../../core/widgets/text_field.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //TODO
        return true;
      },
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
                          onTap: () {
                            //TODO
                          },
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
                          controller: TextEditingController(),
                        ),
                        WTextField(
                          title: 'Event description',
                          controller: TextEditingController(),
                          maxLines: 6,
                        ),
                        WTextField(
                          title: 'Event location',
                          controller: TextEditingController(),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: 0,
                            items: AppConstants.todoColors.map((Color color) {
                              return DropdownMenuItem<int>(
                                value: AppConstants.todoColors.indexOf(color),
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    color: color,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (selectedColor) {},
                          ),
                        ),
                        WTextField(
                          title: 'Event time',
                          controller: TextEditingController(),
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
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext builder) {
                        return Container(
                            height:
                                MediaQuery.of(context).copyWith().size.height /
                                    3,
                            child: CupertinoDatePicker(
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (DateTime newdate) {
                                print(newdate);
                              },
                              use24hFormat: true,
                              mode: CupertinoDatePickerMode.date,
                            ));
                      });
                  //TODO
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
