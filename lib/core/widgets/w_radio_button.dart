import 'package:flutter/material.dart';

class WRadioButton<T> extends StatelessWidget {
  final T groupValue;
  final T value;
  final ValueChanged<T> onChange;
  final Color activeColor;
  final Color disabledColor;
  const WRadioButton({
    required this.onChange,
    required this.groupValue,
    this.disabledColor = Colors.white,
    this.activeColor = Colors.white,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onChange(value);
      },
      child: AnimatedContainer(
        width: 20,
        height: 20,
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: groupValue == value ? activeColor : disabledColor,
          ),
        ),
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          margin: const EdgeInsets.all(3.33),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: groupValue == value ? activeColor : disabledColor,
          ),
        ),
      ),
    );
  }
}
