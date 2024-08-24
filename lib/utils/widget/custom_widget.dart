import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Container(
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
            child: Text(
              '21',
              style: defaultText20B.copyWith(
                color: Colors.white,
              ),
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
                  'Lorem ipsum 1',
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
      // width: 130.w,
      height: 20,
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
            width: 10.w,
          ),
          Text(title),
          hasNumber
              ? Container(
                  decoration: BoxDecoration(
                    color: keyBlack,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  height: 20.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  margin: EdgeInsets.only(left: 8.h),
                  child: Center(
                    child: Text(
                      '$count',
                      style: defaultText12M.copyWith(color: Colors.white),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    ),
  );
}
