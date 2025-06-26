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
                    borderRadius: kCircular35Border,
                    border: Border.all(
                      width: 1.96,
                      color: AppColors.mainAccent,
                    ),
                  ),
                  child: Column(
                    spacing: 38,
                    children: [
                      AppTextField(hintText: 'Login'),
                      AppTextField(hintText: 'Password'),
                    ],
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
                fixedSize: const Size(228.54, 74.36),
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

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFFA3A2A2)),
        filled: true,
        fillColor: Color(0xFF313535),
        border: OutlineInputBorder(
          borderRadius: kCircular35Border,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: kCircular35Border,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: kCircular35Border,
          borderSide: BorderSide(color: Colors.tealAccent),
        ),
      ),
    );
  }
}
