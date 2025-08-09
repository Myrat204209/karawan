import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MarketFilterView extends HookWidget {
  const MarketFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = useState<String>('Hemmesi');
    final selectedType = useState<String>('Hemmesi');
    final selectedAdvertisement = useState<String>('Hemmesi');
    final priceRange = useState<RangeValues>(const RangeValues(10, 1000));
    final selectedRating = useState<int>(1);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                ),
                const Expanded(
                  child: Text(
                    'Filter',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Filter Content
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sazlamalar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            selectedCategory.value = 'Hemmesi';
                            selectedType.value = 'Hemmesi';
                            selectedAdvertisement.value = 'Hemmesi';
                            priceRange.value = const RangeValues(10, 1000);
                            selectedRating.value = 1;
                          },
                          child: Text(
                            'Arassala',
                            style: TextStyle(
                              color: AppColors.getSectionAccent(
                                AppSection.store,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Category Filter
                    _buildFilterSection(
                      'Kategoriýa',
                      selectedCategory.value,
                      ['Hemmesi', 'Elektronika', 'Geyim', 'Azyk'],
                      (value) => selectedCategory.value = value,
                    ),
                    const SizedBox(height: 20),

                    // Type Filter
                    _buildFilterSection(
                      'Görnüşi',
                      selectedType.value,
                      ['Hemmesi', 'Ýeni', 'Arzan', 'Populyar'],
                      (value) => selectedType.value = value,
                    ),
                    const SizedBox(height: 20),

                    // Price Filter
                    _buildPriceFilter(priceRange),
                    const SizedBox(height: 20),

                    // Rating Filter
                    _buildRatingFilter(selectedRating),
                    const SizedBox(height: 20),

                    // Advertisement Filter
                    _buildFilterSection(
                      'Reklama boýunça',
                      selectedAdvertisement.value,
                      ['Hemmesi', 'Reklamaly', 'Reklamasız'],
                      (value) => selectedAdvertisement.value = value,
                    ),

                    const SizedBox(height: 32),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Apply filters
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.getSectionAccent(
                            AppSection.store,
                          ),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Ýatda sakla',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(
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
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
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
                if (newValue != null) {
                  onChanged(newValue);
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceFilter(ValueNotifier<RangeValues> priceRange) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bahasy',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          '${priceRange.value.start.round()} tmt - ${priceRange.value.end.round()} tmt',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        RangeSlider(
          values: priceRange.value,
          min: 10,
          max: 1000,
          divisions: 99,
          activeColor: AppColors.getSectionAccent(AppSection.store),
          inactiveColor: Colors.grey[300],
          onChanged: (RangeValues values) {
            priceRange.value = values;
          },
        ),
      ],
    );
  }

  Widget _buildRatingFilter(ValueNotifier<int> selectedRating) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Baha bermek',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () => selectedRating.value = index + 1,
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: selectedRating.value >= index + 1
                      ? AppColors.getSectionAccent(AppSection.store)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.getSectionAccent(AppSection.store),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: selectedRating.value >= index + 1
                          ? Colors.white
                          : AppColors.getSectionAccent(AppSection.store),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 12,
                        color: selectedRating.value >= index + 1
                            ? Colors.white
                            : AppColors.getSectionAccent(AppSection.store),
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
