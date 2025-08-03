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
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.outlined(
            onPressed: onRemove,
            style: IconButton.styleFrom(
              backgroundColor: AppColors.lightGrey,
              side: BorderSide.none,
            ),
            padding: EdgeInsets.all(0),
            visualDensity: VisualDensity.compact,
            icon: Icon(Icons.remove, color: Colors.white),
          ),

          Text(
            '1',
            style: AppTextStyle.text().md().bold().withColor(Color(0xFF6D6D6D)),
          ),
          IconButton.outlined(
            onPressed: onAdd,
            style: IconButton.styleFrom(
              backgroundColor: AppColors.mainAccent,
              side: BorderSide.none,
            ),

            padding: EdgeInsets.all(0),
            visualDensity: VisualDensity.compact,
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
