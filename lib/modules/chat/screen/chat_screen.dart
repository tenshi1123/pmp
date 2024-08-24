import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180.h,
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
                    bottom: 70.h,
                    left: 22.w,
                    child: Text(
                      'Thời khóa biểu',
                      style: defaultText20B.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30.h,
                    left: 250.w,
                    child: Image.asset(
                      'assets/images/schedule_icon.png',
                      width: 115.w,
                      height: 92.h,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
