import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketFilterView extends StatefulWidget {
  const MarketFilterView({super.key});

  @override
  State<MarketFilterView> createState() => _MarketFilterViewState();
}

class _MarketFilterViewState extends State<MarketFilterView> {
  RangeValues _priceRange = const RangeValues(0, 1000);
  String _selectedSortBy = 'Popular';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      appBar: AppBar(
        title: Text(
          'Filter',
          style: AppTextStyle.text().lg().semiBold().withColor(Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Reset filters
              setState(() {
                _priceRange = const RangeValues(0, 1000);
                _selectedSortBy = 'Popular';
              });
            },
            child: Text(
              'Temizle',
              style: AppTextStyle.text().md().withColor(AppColors.mainAccent),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),

            // Price Range
            Text(
              'Bahasy',
              style: AppTextStyle.text().lg().semiBold().withColor(
                Colors.black,
              ),
            ),
            SizedBox(height: 10.h),
            RangeSlider(
              values: _priceRange,
              min: 0,
              max: 1000,
              divisions: 20,
              activeColor: AppColors.mainAccent,
              onChanged: (RangeValues values) {
                setState(() {
                  _priceRange = values;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TMT ${_priceRange.start.round()}',
                  style: AppTextStyle.text().sm().withColor(AppColors.grey),
                ),
                Text(
                  'TMT ${_priceRange.end.round()}',
                  style: AppTextStyle.text().sm().withColor(AppColors.grey),
                ),
              ],
            ),

            SizedBox(height: 30.h),

            // Sort By
            Text(
              'Düzüş',
              style: AppTextStyle.text().lg().semiBold().withColor(
                Colors.black,
              ),
            ),
            SizedBox(height: 15.h),
            Column(
              children:
                  [
                        'Popular',
                        'Price: Low to High',
                        'Price: High to Low',
                        'Newest',
                      ]
                      .map(
                        (sortOption) => RadioListTile<String>(
                          title: Text(sortOption),
                          value: sortOption,
                          groupValue: _selectedSortBy,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedSortBy = value!;
                            });
                          },
                          activeColor: AppColors.mainAccent,
                        ),
                      )
                      .toList(),
            ),

            Spacer(),

            // Apply Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Apply filters and navigate back
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Uygula',
                  style: AppTextStyle.text().lg().semiBold().withColor(
                    Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
