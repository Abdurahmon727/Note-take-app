import 'package:flutter/material.dart';

import '../../assets/colors.dart';

class WTextField extends StatelessWidget {
  const WTextField({
    super.key,
    required this.title,
    this.maxLines = 1,
    required this.controller,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.onTap,
    this.isReadOnly = false,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
  });

  final String title;
  final int? maxLines;
  final TextEditingController controller;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onTap;
  final bool isReadOnly;
  final TextInputAction textInputAction;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 4),
          TextField(
            maxLength: maxLength,
            readOnly: isReadOnly,
            onTap: onTap,
            controller: controller,
            maxLines: maxLines,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              fillColor: greyBackground,
              counterText: '',
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
