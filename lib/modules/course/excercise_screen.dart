import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/Excercise_tab_widget.dart';
import 'package:pmp_english/utils/widget/custom_widget.dart';

class ExcerciseScreen extends StatelessWidget {
  const ExcerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sắp đến hạn',
            style: defaultText16B,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            height: 222.h,
            width: 349.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                const ExcerciseItem(),
                const ExcerciseItem(),
              ],
            ),
          ),
          SizedBox(
              height: 330.h,
              width: 390.w,
              child: const ExcerciseTabBar('Flights')),
        ],
      ),
    );
  }
}
