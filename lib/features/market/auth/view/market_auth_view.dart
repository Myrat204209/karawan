import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketAuthView extends StatefulWidget {
  const MarketAuthView({super.key});

  @override
  State<MarketAuthView> createState() => _MarketAuthViewState();
}

class _MarketAuthViewState extends State<MarketAuthView> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      appBar: AppBar(
        title: Text(
          'Hasaba girmek',
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
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),

              Text(
                'Telefon nomer',
                style: AppTextStyle.text().md().semiBold().withColor(
                  Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '+993 XX XXXXXX',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.phone, color: AppColors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Telefon nomer gerekli';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20.h),

              Text(
                'Parol',
                style: AppTextStyle.text().md().semiBold().withColor(
                  Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Parolyňyzy giriziň',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.lock, color: AppColors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Parol gerekli';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30.h),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle login
                      Navigator.of(context).pop();
                    }
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
                    'Girmek',
                    style: AppTextStyle.text().lg().semiBold().withColor(
                      Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to registration
                  },
                  child: Text(
                    'Hasab yok mu? Döret',
                    style: AppTextStyle.text().md().withColor(
                      AppColors.mainAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
