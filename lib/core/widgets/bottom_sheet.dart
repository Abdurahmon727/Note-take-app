import 'dart:ui';

import 'package:flutter/material.dart';

import '../../assets/colors.dart';
import 'w_button.dart';

void fShowBottomSheet({
  required BuildContext context,
  required VoidCallback onTapButton,
  required List<Widget> children,
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
                  child: const Text(
                    'Apply',
                    style: TextStyle(
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
