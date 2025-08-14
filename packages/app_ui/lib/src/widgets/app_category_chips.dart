import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppCategoryChips extends StatefulWidget {
  const AppCategoryChips({
    super.key,
    required this.chipLabels,
    required this.selectedColor,
  });

  final List<String> chipLabels;
  final Color selectedColor;
  @override
  State<AppCategoryChips> createState() => _AppCategoryChipsState();
}

class _AppCategoryChipsState extends State<AppCategoryChips> {
  final Set<int> _selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    final chipLabels = widget.chipLabels;
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
        itemCount: chipLabels.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndices.contains(index);
          return Padding(
            padding: EdgeInsets.only(right: AppSpacing.sm),
            child: ChoiceChip(
              showCheckmark: false,
              label: Text(chipLabels[index]),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedIndices.add(index);
                  } else {
                    _selectedIndices.remove(index);
                  }
                });
              },
              shape: const StadiumBorder(),
              side:
                  isSelected
                      ? BorderSide.none
                      : const BorderSide(color: AppColors.border),
              backgroundColor: Colors.transparent,
              selectedColor: widget.selectedColor,
              labelStyle: AppTextStyle.text().sm().regular().withColor(
                isSelected ? Colors.white : AppColors.textLightTitle,
              ),
            ),
          );
        },
      ),
    );
  }
}
