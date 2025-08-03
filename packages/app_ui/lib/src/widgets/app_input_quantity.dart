import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppInputQuantity extends StatelessWidget {
  const AppInputQuantity({
    super.key,
    required this.onRemove,
    required this.onAdd,
  });
  final VoidCallback onRemove;
  final VoidCallback onAdd;

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
          InputIcon(onTap: onRemove),

          Text(
            '1',
            style: AppTextStyle.text().md().bold().withColor(Color(0xFF6D6D6D)),
          ),
          InputIcon(onTap: onRemove, isAdd: true),
        ],
      ).paddingAll(4),
    );
  }
}

class InputIcon extends StatelessWidget {
  const InputIcon({super.key, required this.onTap, this.isAdd = false});
  final bool isAdd;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: !isAdd ? AppColors.lightGrey : AppColors.mainAccent,
        side: BorderSide.none,
        minimumSize: Size.fromRadius(4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,

        padding: EdgeInsets.all(0),
      ),
      padding: EdgeInsets.all(0),
      icon: Icon(isAdd ? Icons.add : Icons.remove, color: Colors.white),
    );
  }
}
