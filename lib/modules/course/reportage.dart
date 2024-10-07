import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/modules/diemdanh/attendance_details.dart';
import 'package:pmp_english/modules/diemdanh/diem_danh_screen.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/custom_widget.dart';

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
          SizedBox(
            height: 10.h,
          ),
          chartItem(width: 350, percents: 92, title: 'Chuyên cần'),
          chartItem(width: 350, percents: 75, title: 'Bài tập'),
          chartItem(width: 350, percents: 100, title: 'Thái độ'),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Liên hệ giảng viên',
            style: defaultText16B,
          ),
          SizedBox(
            height: 10.h,
          ),
          const ConversationItem(
            index: 1,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Điểm danh',
            style: defaultText16B,
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AttendanceDetails(),
                ),
              );
            },
            child: Container(
              width: 350.w,
              //height: 208.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
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
                  Container(
                    width: 320.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: key2Color,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Ví khóa học',
                          style: defaultText16B.copyWith(color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          '24.000.000 VND',
                          style: defaultText16B.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 168.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 100.h,
                              width: 100.h,
                              child: const PieChart(),
                            ),
                            const Spacer(),
                            Text(
                              'Đã học',
                              style: defaultText14M,
                            ),
                            Text(
                              '24',
                              style: defaultText16B,
                            ),
                            
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Tổng số buổi',
                              style: defaultText14M,
                            ),
                            Text(
                              '40',
                              style: defaultText14M,
                            ),
                            const Spacer(),
                            Text(
                              'Vắng mặt',
                              style: defaultText14M,
                            ),
                            Text(
                              '2',
                              style: defaultText14M,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Còn lại',
                              style: defaultText14M,
                            ),
                            Text(
                              '16',
                              style: defaultText14M,
                            ),
                            const Spacer(),
                            Text(
                              'Xin nghỉ',
                              style: defaultText14M,
                            ),
                            Text(
                              '1',
                              style: defaultText14M,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
