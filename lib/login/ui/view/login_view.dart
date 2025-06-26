import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161919),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 836.69,
            height: 400.34,
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.22),
                    border: Border.all(
                      width: 1.96,
                      color: AppColors.mainAccent,
                    ),
                  ),
                  child: Column(
                    spacing: 38,
                    children: [TextFormField(), TextFormField()],
                  ).paddingSymmetric(horizontal: 47, vertical: 80),
                ),
              ],
            ),
          ),
          Positioned(
            top: 280,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.mainAccent,
              ),
              child: Text('Login'),
            ),
          ),
        ],
      ).centralize(),
    );
  }
}
