import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ojak/app/router/app_router.gr.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromRGBO(22, 25, 25, 1),
      body: Center(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome home!!',
                style: AppTextStyle.display().md().bold().withColor(
                  AppColors.alertLightAccent,
                ),
              ).paddingOnly(bottom: 22),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: kCircular35Border,
                      border: Border.all(
                        width: 2.96,
                        color: AppColors.mainAccent,
                      ),
                    ),
                    child: SizedBox(
                      width: 836.69,
                      height: 400.34,
                      child: Column(
                        spacing: 38,
                        children: [
                          AppTextField(hintText: 'Login'),
                          AppTextField(hintText: 'Password'),
                        ],
                      ).paddingSymmetric(horizontal: 47).paddingOnly(top: 80),
                    ),
                  ).paddingOnly(bottom: 74),
                  Positioned(
                    top: 358,
                    child: OutlinedButton(
                      onPressed: () {
                        context.router.popAndPush(AppBottomNavigation());
                      },
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(228.54, 74.36),
                        backgroundColor: AppColors.mainAccent,
                      ),
                      child: Text(
                        'Login',
                        style: AppTextStyle.text()
                            .medium()
                            .withFontSize(25)
                            .withColor(Color(0xFF161919)),
                      ),
                    ),
                  ),
                ],
              ).centralize(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppTextField extends StatefulWidget {
  const AppTextField({super.key, required this.hintText});
  final String hintText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Scrollable.ensureVisible(
          context,
          alignment: 0.5, // Centers the field vertically
          duration: Duration(milliseconds: 200),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
      focusNode: _focusNode,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        isDense: false,

        contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 58.4),
        hintText: widget.hintText,
        constraints: BoxConstraints.tightFor(width: 742.71, height: 82.17),
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
          borderSide: BorderSide(color: AppColors.mainAccent),
        ),
      ),
    );
  }
}
