import 'dart:ui';

import 'package:flutter/material.dart';

import '../../assets/colors.dart';
import '../widgets/w_button.dart';

void fShowBottomSheet({
  required BuildContext context,
  required VoidCallback onTapButton,
  required List<Widget> children,
  String buttonTitle = 'Apply',
}) =>
    showModalBottomSheet(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children +
              [
                WButton(
                  margin: const EdgeInsets.all(12),
                  height: 45,
                  onTap: onTapButton,
                  child: Text(
                    buttonTitle,
                    style: const TextStyle(
                      color: white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
        ),
      ),
    );
