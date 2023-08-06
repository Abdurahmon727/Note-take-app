import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/icons.dart';

class WEventPreview extends StatelessWidget {
  const WEventPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(12, 22, 12, 12),
          decoration: BoxDecoration(
            color: blue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Watching Football ',
                style: TextStyle(
                    color: blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Manchester United vs Arsenal (Premiere League)',
                style: TextStyle(
                    color: blue,
                    fontSize: 8,
                    fontWeight: FontWeight.w400),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.clock),
                      const SizedBox(width: 4),
                      Text(
                        '17:00 - 18:30',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.location),
                      const SizedBox(width: 4),
                      Text(
                        'Stamford Bridge',
                        style: TextStyle(
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
              color: blue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
        ),
      ],
    );
  }
}
