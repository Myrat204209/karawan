import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FilterModalBottomSheet extends HookWidget {
  const FilterModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = useState<String>('Hemmesi');
    final selectedType = useState<String>('Hemmesi');
    final selectedAdvertisement = useState<String>('Hemmesi');
    final priceRange = useState<RangeValues>(const RangeValues(10, 1000));
    final selectedRating = useState<int>(1);

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Filter',
              style: AppTextStyle.text().lg().bold().withColor(Colors.black),
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFilterSection(
                    context,
                    'Kategoriýa',
                    selectedCategory.value,
                    ['Hemmesi', 'Elektronika', 'Geyim', 'Azyk'],
                    (value) => selectedCategory.value = value,
                  ),
                  const SizedBox(height: 20),

                  _buildFilterSection(
                    context,
                    'Görnüşi',
                    selectedType.value,
                    ['Hemmesi', 'Ýeni', 'Arzan', 'Populyar'],
                    (value) => selectedType.value = value,
                  ),
                  const SizedBox(height: 20),

                  _buildPriceFilter(context, priceRange),
                  const SizedBox(height: 20),

                  _buildRatingFilter(context, selectedRating),
                  const SizedBox(height: 20),

                  _buildFilterSection(
                    context,
                    'Reklama boýunça',
                    selectedAdvertisement.value,
                    ['Hemmesi', 'Reklamaly', 'Reklamasız'],
                    (value) => selectedAdvertisement.value = value,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Apply Button
          Container(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.getSectionAccent(
                    AppSection.market,
                  ),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Sargyt et',
                  style: AppTextStyle.text().md().bold().withColor(
                    Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(
    BuildContext context,
    String title,
    String selectedValue,
    List<String> options,
    ValueChanged<String> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.text().md().bold().withColor(Colors.black),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) onChanged(newValue);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceFilter(
    BuildContext context,
    ValueNotifier<RangeValues> priceRange,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bahasy',
          style: AppTextStyle.text().md().bold().withColor(Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          '${priceRange.value.start.round()} tmt - ${priceRange.value.end.round()} tmt',
          style: AppTextStyle.text().sm().withColor(Colors.grey),
        ),
        const SizedBox(height: 8),
        RangeSlider(
          values: priceRange.value,
          min: 10,
          max: 1000,
          divisions: 99,
          activeColor: AppColors.getSectionAccent(AppSection.market),
          inactiveColor: Colors.grey[300],
          onChanged: (RangeValues values) => priceRange.value = values,
        ),
      ],
    );
  }

  Widget _buildRatingFilter(
    BuildContext context,
    ValueNotifier<int> selectedRating,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Baha bermek',
          style: AppTextStyle.text().md().bold().withColor(Colors.black),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(5, (index) {
            final isOn = selectedRating.value >= index + 1;
            return GestureDetector(
              onTap: () => selectedRating.value = index + 1,
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isOn
                      ? AppColors.getSectionAccent(AppSection.market)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.getSectionAccent(AppSection.market),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: isOn
                          ? Colors.white
                          : AppColors.getSectionAccent(AppSection.market),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${index + 1}',
                      style: AppTextStyle.text().xs().withColor(
                        isOn
                            ? Colors.white
                            : AppColors.getSectionAccent(AppSection.market),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
