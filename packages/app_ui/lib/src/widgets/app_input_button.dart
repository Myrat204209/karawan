import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppInputButton extends StatelessWidget {
  const AppInputButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.minValue = 0,
    this.maxValue = 99,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final int minValue;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF3F3F3),
      ),
      child: Row(
        spacing: 15,
        mainAxisSize: MainAxisSize.min,
        children: [
          InputButtonIcon(
            onTap: () {
              if (value > minValue) {
                onChanged(value - 1);
              }
            },
            isEnabled: value > minValue,
          ),
          Text(
            value.toString(),
            style: AppTextStyle.text().md().bold().withColor(Color(0xFF6D6D6D)),
          ),
          InputButtonIcon(
            onTap: () {
              if (value < maxValue) {
                onChanged(value + 1);
              }
            },
            isAdd: true,
            isEnabled: value < maxValue,
          ),
        ],
      ).paddingAll(4),
    );
  }
}

class InputButtonIcon extends StatelessWidget {
  const InputButtonIcon({
    super.key,
    required this.onTap,
    this.isAdd = false,
    this.isEnabled = true,
  });

  final bool isAdd;
  final bool isEnabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: isEnabled ? onTap : null,
      style: IconButton.styleFrom(
        backgroundColor: !isAdd 
            ? (isEnabled ? AppColors.lightGrey : Colors.grey.withValues(alpha: 0.3))
            : (isEnabled ? AppColors.mainAccent : Colors.grey.withValues(alpha: 0.3)),
        side: BorderSide.none,
        minimumSize: Size.fromRadius(4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(0),
      ),
      padding: EdgeInsets.all(0),
      icon: Icon(
        isAdd ? Icons.add : Icons.remove,
        color: isEnabled ? Colors.white : Colors.grey,
      ),
    );
  }
} 