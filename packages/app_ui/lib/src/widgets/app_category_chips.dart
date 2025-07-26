import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppCategoryChips extends StatefulWidget {
  const AppCategoryChips({super.key, required this.chipLabels});

  final List<String> chipLabels;
  @override
  State<AppCategoryChips> createState() => _AppCategoryChipsState();
}

class _AppCategoryChipsState extends State<AppCategoryChips> {
  final Set<int> _selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    final chipLabels = widget.chipLabels;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,

          padding: const EdgeInsets.symmetric(horizontal: 20),

          itemCount: chipLabels.length,

          itemBuilder: (context, index) {
            final isSelected = _selectedIndices.contains(index);
            return Padding(
              padding: const EdgeInsets.only(right: 8),
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
                selectedColor: AppColors.mainAccent,
                labelStyle: AppTextStyle.text().sm().withColor(
                  isSelected
                      ? AppColors.secondStoreAccent
                      : AppColors.textLightTitle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
