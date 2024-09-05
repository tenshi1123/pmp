import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/custom_widget.dart';

import '../diemdanh/diem_danh_screen.dart';

class ReportageScreen extends StatelessWidget {
  const ReportageScreen({super.key});

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
          const Column(
            children: [
              ExcerciseItem(),
              ExcerciseItem(),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 120.h,
                width: 120.w,
                child: const PieChart(),
              ),
              SizedBox(
                height: 90.h,
                width: 130.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lớp',
                          style: defaultText12Re,
                        ),
                        Text(
                          'TTH4',
                          style: defaultText12B,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bắt đầu',
                          style: defaultText12Re,
                        ),
                        Text(
                          '07/05/2024',
                          style: defaultText12B,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kết thúc',
                          style: defaultText12Re,
                        ),
                        Text(
                          '07/10/2024',
                          style: defaultText12B,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
