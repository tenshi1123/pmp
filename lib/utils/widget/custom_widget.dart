import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pmp_english/modules/lesson/detail_lesson_screen.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class Lesson extends StatelessWidget {
  const Lesson(
      {super.key,
      required this.title1,
      required this.title2,
      required this.title3});
  final String title1;
  final String title2;
  final String title3;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DetailLessonScreen(),
          ),
        );
      },
      child: Container(
        height: 100.h,
        width: 350.w,
        margin: EdgeInsets.only(bottom: 10.h, right: 10.w, left: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                gradient: mainGradient2,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '21',
                    style: defaultText20B.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Tháng 5',
                    style: defaultText16M.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            SizedBox(
              height: 70.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'TOEIC 4 kỹ năng - Buổi 3',
                    style: defaultText16B,
                  ),
                  Text(
                    '21/05/2024',
                    style: defaultText14Re,
                  ),
                  Text(
                    '08:00 - 11:00 ~ 3 tiếng',
                    style: defaultText14Re,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExcerciseItem extends StatelessWidget {
  const ExcerciseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.h,
      width: 350.w,
      margin: EdgeInsets.only(bottom: 10.h, right: 10.w, left: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: mainGradient2,
            ),
            child: SvgPicture.asset(
              'assets/icons/excercise.svg',
              height: 18.h,
              width: 18.w,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          SizedBox(
            height: 70.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Bai tap 1',
                  style: defaultText16B,
                ),
                Text(
                  'Hạn nộp: 27 tháng 5, 2024',
                  style: defaultText14Re,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget homeTab(
    {required String title,
    bool isSeprator = true,
    bool hasNumber = true,
    int count = 0}) {
  return Tab(
    child: Container(
      //width: 70.w,
      height: 30.h,
      decoration: isSeprator
          ? const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 3.w,
          ),
          SizedBox(
            width: 77.w,
            child: Center(
              child: Text(
                title,
              ),
            ),
          ),
          hasNumber
              ? Container(
                  decoration: BoxDecoration(
                    color: keyBlack,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  height: 15.h,
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: Center(
                    child: Text(
                      '10',
                      style: defaultText12B.copyWith(color: Colors.white),
                    ),
                  ),
                )
              : SizedBox(
                  width: 10.w,
                ),
        ],
      ),
    ),
  );
}

Widget chartItem({
  required int width,
  required int percents,
  required String title,
}) {
  return Container(
    height: 34.h,
    width: width.w,
    margin: EdgeInsets.only(bottom: 10.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.r),
      color: state2,
    ),
    child: Stack(
      children: [
        Positioned(
            left: 0,
            child: Container(
              height: 34.h,
              width: width.w * percents / 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                gradient: mainGradient,
              ),
            )),
        Positioned(
          left: 10.w,
          right: 10.w,
          child: SizedBox(
            height: 34.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: defaultText14B.copyWith(color: Colors.white),
                ),
                Text(
                  '$percents%',
                  style: defaultText14B,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
