import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class ExamScheduleScreen extends StatelessWidget {
  const ExamScheduleScreen({super.key});

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
                          'Lịch thi',
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
                  right: 20,
                  child: Image.asset(
                    'assets/images/lich_thi.png',
                    width: 156.w,
                    height: 118.h,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
