import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

import 'detail_evaluate_screen.dart';

class EvaluateScreen extends StatelessWidget {
  const EvaluateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                          'Đánh giá',
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
                    'assets/images/danh_gia.png',
                    width: 118.w,
                    height: 115.h,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
          Text(
            'Đánh giá từ Giáo viên',
            style: defaultText16B,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 5,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailEvaluateScreen(),
                        ),
                      );
                    },
                    child: const EvaluateItem(
                        //index: index,
                        ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class EvaluateItem extends StatelessWidget {
  const EvaluateItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 166.h,
      width: 350.w,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Đánh giá định kỳ tháng 7',
                style: defaultText14B,
              ),
              Text(
                '28.07.2024',
                style: defaultText12Re,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: 330.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 120.w,
                      child: Text(
                        'Giảng viên',
                        style: defaultText14Re,
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Nguyễn Phú',
                        style: defaultText14B,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 120.w,
                      child: Text(
                        'Khóa học',
                        style: defaultText14Re,
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'TOEIC 4 kỹ năng',
                        style: defaultText14B,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 120.w,
                      child: Text(
                        'Lớp',
                        style: defaultText14Re,
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'TTH001',
                        style: defaultText14B,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
