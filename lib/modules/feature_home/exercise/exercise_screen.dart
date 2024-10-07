import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/modules/diemdanh/diem_danh_screen.dart';
import 'package:pmp_english/modules/feature_home/exercise/exercise_detail_screen.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/excercise_tab_widget.dart';
import 'package:pmp_english/utils/widget/custom_widget.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 160.h,
              width: 390.w,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 390.w,
                      height: 140.h,
                      decoration: BoxDecoration(gradient: mainGradient),
                    ),
                  ),
                  Positioned(
                    bottom: 30.h,
                    left: 20.w,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_left,
                            size: 30.h,
                            color: Colors.white,
                          ),
                          Text(
                            'Bài tập',
                            style: defaultText20B.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/bai_tap.png',
                      width: 125.w,
                      height: 125.h,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 350.w,
              child: Text(
                'Thống kê',
                style: defaultText16B,
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 100.h,
                  width: 100.h,
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
                            'Đúng hạn',
                            style: defaultText14B.copyWith(color: main1Color),
                          ),
                          Text(
                            '16/20',
                            style: defaultText14B.copyWith(color: main1Color),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quá hạn',
                            style: defaultText14B.copyWith(color: sub2Color),
                          ),
                          Text(
                            '1/20',
                            style: defaultText14B.copyWith(color: sub2Color),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Chưa làm',
                            style: defaultText14B.copyWith(
                              color: key1Color.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            '3/20',
                            style: defaultText14B.copyWith(
                              color: key1Color.withOpacity(0.5),
                            ),
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
            SizedBox(
              width: 350.w,
              child: Text(
                'Sắp đến hạn',
                style: defaultText16B,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TestScreen(),
                  ));
                },
                child: const ExcerciseItem(
                  isComplete: false,
                )),
            SizedBox(
              height: 400.h,
              width: 390.w,
              child: const ExcerciseTabBar('Flights'),
            ),
          ],
        ),
      ),
    );
  }
}
