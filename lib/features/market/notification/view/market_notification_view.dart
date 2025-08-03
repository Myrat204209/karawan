import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketNotificationView extends StatelessWidget {
  const MarketNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      appBar: AppBar(
        title: Text(
          'Bildiriş',
          style: AppTextStyle.text().lg().semiBold().withColor(Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),

            // Notification card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.mainAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: AppColors.mainAccent.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_active,
                        color: AppColors.mainAccent,
                        size: 24,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Üns beriň!',
                        style: AppTextStyle.text().lg().semiBold().withColor(
                          AppColors.mainAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'Hormatly müjderi, bizi markedimizde siz üçin himija we dürli harytlara uly arzonlady bardygyny duydurjarya.',
                    style: AppTextStyle.text().md().withColor(Colors.black87),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bugün, 14:30',
                        style: AppTextStyle.text().sm().withColor(
                          AppColors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Mark as read
                        },
                        child: Text(
                          'Oka diýildi',
                          style: AppTextStyle.text().sm().withColor(
                            AppColors.mainAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            Text(
              'Öňki bildirişler',
              style: AppTextStyle.text().lg().semiBold().withColor(
                Colors.black,
              ),
            ),

            SizedBox(height: 15.h),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: AppColors.mainAccent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.local_offer,
                            color: AppColors.mainAccent,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arzonlady ${index + 1}',
                                style: AppTextStyle.text()
                                    .md()
                                    .semiBold()
                                    .withColor(Colors.black),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'Harytlar ${index + 1}% arzonlady bilen satylyar',
                                style: AppTextStyle.text().sm().withColor(
                                  AppColors.grey,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${index + 1}g',
                          style: AppTextStyle.text().xs().withColor(
                            AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
