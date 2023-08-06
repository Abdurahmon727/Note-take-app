// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udevs_task/assets/constants.dart';
import 'package:udevs_task/features/home/data/models/event_model.dart';
import 'package:udevs_task/features/home/presentaion/pages/event_page.dart';

import '../../../../assets/icons.dart';
import '../../../../core/navigator.dart';

class WEventPreview extends StatefulWidget {
  const WEventPreview({
    super.key,
    required this.model,
  });
  final EventModel model;

  @override
  State<WEventPreview> createState() => _WEventPreviewState();
}

class _WEventPreviewState extends State<WEventPreview> {
  late final Color lightColor;
  late final Color darkColor;
  @override
  void initState() {
    super.initState();
    lightColor = AppConstants.todoLightColors[widget.model.colorIndex];
    darkColor = AppConstants.todoDarkColors[widget.model.colorIndex];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        material(page: EventPage(model: widget.model)),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(12, 22, 12, 12),
            decoration: BoxDecoration(
              color: lightColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.name,
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.model.description,
                  style: TextStyle(
                      color: darkColor,
                      fontSize: 8,
                      fontWeight: FontWeight.w400),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    if (widget.model.time.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppIcons.clock, color: darkColor),
                            const SizedBox(width: 4),
                            Text(
                              widget.model.time,
                              style: TextStyle(
                                  color: darkColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    if (widget.model.location.isNotEmpty)
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.location, color: darkColor),
                          const SizedBox(width: 4),
                          Text(
                            widget.model.location,
                            style: TextStyle(
                                color: darkColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            decoration: BoxDecoration(
                color: lightColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
          ),
        ],
      ),
    );
  }
}
