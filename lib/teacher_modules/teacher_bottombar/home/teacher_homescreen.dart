import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:pmp_english/modules/chat/screen/list_conversation_screen.dart';
import 'package:pmp_english/modules/notification/notification.dart';
import 'package:pmp_english/teacher_modules/teacher_bottombar/home/lichhen_screen.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../teacher_class/teacher_detail_lesson.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 390.w,
          height: 844.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 68.h,
              ),
              const _AvatarRow(),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 16.h),
                child: Text(
                  'Hi, Trâm Anh',
                  style: defaultText16B.copyWith(
                      fontSize: 24.sp, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 2.h),
                child: Text(
                  'Today, 24 Nov 2025',
                  style: defaultText16Re.copyWith(
                    fontSize: 16.sp,
                    color: Colors.white.withValues(alpha: 0.72),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.r),
                      topRight: Radius.circular(32.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 28.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Text(
                            'Lịch dạy gần nhất',
                            style: defaultText16B,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.r),
                              ),
                              child: SizedBox(
                                height: 208.h,
                                width: 390.w,
                                child: PageView.builder(
                                  padEnds: false,
                                  controller: controller,
                                  itemCount: 3,
                                  itemBuilder: (_, index) {
                                    return const _CommingSchedule();
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            SmoothPageIndicator(
                              controller: controller,
                              count: 3,
                              effect: CustomizableEffect(
                                activeDotDecoration: DotDecoration(
                                  width: 20.w,
                                  height: 8.h,
                                  color: const Color(0xff00AEEF),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                dotDecoration: DotDecoration(
                                  width: 8.w,
                                  height: 8.h,
                                  color: const Color(0xff00AEEF)
                                      .withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(16),
                                  verticalOffset: 0,
                                ),
                                spacing: 6.0,
                              ),
                              onDotClicked: (index) {
                                controller.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                              width: 390.w,
                              height: 390.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.r),
                                  topRight: Radius.circular(32.r),
                                ),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/bottom_background.png"),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        pushWithoutNavBar(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LichHenScreen()));
                                      },
                                      child: const AppointmentCard()),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class _AvatarRow extends StatelessWidget {
  const _AvatarRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16.w,
        ),
        Image.asset(
          'assets/images/avatar.png',
          height: 48.h,
          width: 48.w,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListConversationScreen(),
              ),
            );
          },
          child: Image.asset(
            'assets/images/mess.png',
            height: 45.h,
            width: 45.w,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationScreen(),
              ),
            );
          },
          child: Image.asset(
            'assets/images/noti.png',
            height: 45.h,
            width: 45.w,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
      ],
    );
  }
}

class _CommingSchedule extends StatelessWidget {
  const _CommingSchedule();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushWithoutNavBar(context,
            MaterialPageRoute(builder: (context) => const LessonDetail()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 10.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff163065).withValues(alpha: 0.12),
              spreadRadius: 0,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff00AEEF),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '01',
                        style: defaultText16B.copyWith(
                            color: Colors.white, fontSize: 26.sp),
                      ),
                      Text(
                        'Tháng 12',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text('Khoá tiếng anh cơ bản - Off',
                          style: defaultText18B),
                    ),
                    const SizedBox(height: 5),
                    Text('Thứ 6 (08:30 - 10:30)', style: defaultText14M),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Phòng học: ',
                style: defaultText16M,
                children: [
                  TextSpan(
                      text: '101',
                      style: defaultText16B.copyWith(
                          color: const Color(0xff00AEEF))),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'Chi nhánh: ',
                style: defaultText16M,
                children: [
                  TextSpan(
                      text: '34 Hồ Thị Tư',
                      style: defaultText16B.copyWith(
                          color: const Color(0xff00AEEF))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon lịch hẹn
          Row(
            children: [
              Image.asset(
                'assets/images/schedule.png', // Đổi thành đường dẫn ảnh của bạn
                width: 40.w,
                height: 40.h,
              ),
              const SizedBox(width: 12),
              const Text(
                "Lịch hẹn học viên",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          // Badge thông báo số lượng
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xffED1C24),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.4),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Text(
              "3", // Số lượng thông báo
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
