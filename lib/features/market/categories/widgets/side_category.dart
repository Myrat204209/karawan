import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SideCategory {
  const SideCategory(this.title);
  final String title;
}

class SideCategoryFilter extends StatefulWidget {
  const SideCategoryFilter({super.key});

  @override
  State<SideCategoryFilter> createState() => _SideCategoryFilterState();
}

class _SideCategoryFilterState extends State<SideCategoryFilter> {
  final List<SideCategory> _categories = [
    const SideCategory('Güller'),
    const SideCategory('Süýjilikler'),
    const SideCategory('Şaý-sep'),
    const SideCategory('Syýahat'),
    const SideCategory('Oýnawaç'),
    const SideCategory('Kitaplar'),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // We return a group of slivers instead of a single adapter.
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. The category list on the left.
              _buildCategoryList(),

              // 2. The product grid on the right, wrapped in Expanded.
              _buildProductGrid(),
            ],
          ),
        ),
      ],
    );
  }

  // Widget for the list of categories on the left.
  Widget _buildCategoryList() {
    return SizedBox(
      width: 100,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: isSelected
                        ? AppColors.mainAccent
                        : Colors.transparent,
                    width: 3,
                  ),
                ),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: Text(
                _categories[index].title,
                style: AppTextStyle.text().md().withColor(
                  isSelected ? AppColors.mainAccent : AppColors.textColor,
                ),
              ),
            ),
          ).paddingSymmetric(vertical: 5);
        },
      ),
    );
  }

  // Widget for the product grid on the right.
  Widget _buildProductGrid() {
    return Expanded(
      child: GridView.builder(
        // 1. Add these two properties to fix the layout error.
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

        itemCount: 8, // Example item count
        padding: const EdgeInsets.only(right: 18, left: 10), // Adjust padding
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18,
          crossAxisSpacing: 10,
          childAspectRatio: 175 / 255, // Adjusted for more text content
        ),
        itemBuilder: (context, index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: kCircular15Border,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 14.1,
                  // 2. Corrected shadow color for clarity
                  color: Colors.black.withValues(alpha: 0.05),
                ),
              ],
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: kCircular15Border,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Assets.images.mineral.image(
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Mineral Water',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Product designers who focus on simplicity & usability',
                            style: TextStyle(fontSize: 9, color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(
                            'TMT 12.00',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
