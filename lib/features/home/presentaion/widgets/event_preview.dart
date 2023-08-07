import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/constants.dart';
import '../../../../assets/icons.dart';
import '../../../../core/navigator.dart';
import '../../data/models/event_model.dart';
import '../pages/event_page.dart';

class WEventPreview extends StatelessWidget {
  const WEventPreview({
    super.key,
    required this.model,
  });
  final EventModel model;

  @override
  Widget build(BuildContext context) {
    final lightColor = AppConstants.todoLightColors[model.colorIndex];
    final darkColor = AppConstants.todoDarkColors[model.colorIndex];
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        material(page: EventPage(model: model)),
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
                  model.name,
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (model.description.isNotEmpty)
                  Text(
                    model.description,
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
                    if (model.time.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppIcons.clock, color: darkColor),
                            const SizedBox(width: 4),
                            Text(
                              model.time,
                              style: TextStyle(
                                  color: darkColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    if (model.location.isNotEmpty)
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(AppIcons.location,
                                color: darkColor),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                model.location,
                                style: TextStyle(
                                    color: darkColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
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
