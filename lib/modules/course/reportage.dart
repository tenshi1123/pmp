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
            'Đánh giá tổng quan',
            style: defaultText16B,
          ),
          chartItem(width: 350, percents: 92, title: 'Chuyên cần'),
          chartItem(width: 350, percents: 75, title: 'Bài tập'),
          chartItem(width: 350, percents: 100, title: 'Thái độ'),
        ],
      ),
    );
  }
}
