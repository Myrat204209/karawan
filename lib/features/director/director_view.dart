import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class DirectorView extends StatelessWidget {
  const DirectorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Market',
              style: AppTextStyle.text().withColor(AppColors.mainAccent),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Restoran',
              style: AppTextStyle.text().withColor(AppColors.mainAccent),
            ),
          ),
        ],
      ),
    );
  }
}
