// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:karawan/store/features.dart';

class StoreCartView extends StatelessWidget {
  const StoreCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Halanlarym',
          style: AppTextStyle.text().lg().bold().withColor(Colors.black),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: 3,
            itemBuilder: (context, index) => CartItem(),
            separatorBuilder: (context, index) => SizedBox(height: 10),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 15).paddingOnly(top: 15);
  }
}
