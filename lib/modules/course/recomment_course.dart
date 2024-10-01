import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class RecommentCourse extends StatefulWidget {
  const RecommentCourse({super.key});

  @override
  State<RecommentCourse> createState() => _RecommentCourseState();
}

class _RecommentCourseState extends State<RecommentCourse>
    with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 259.h,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: Container(
                          width: 390.w,
                          height: 259.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/course_image.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 52.h,
                        left: 20.w,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 43.h,
                            width: 43.w,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.arrow_back,
                              color: key1Color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'TOEIC 4 kỹ năng',
                        style: defaultText20B,
                      ),
                      Text(
                        'Đầu ra: TOEIC Nghe Đọc 650+',
                        style: defaultText14M,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 166.w,
                            height: 86.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ]),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                SvgPicture.asset(
                                    'assets/icons/learning_path.svg'),
                                SizedBox(
                                  width: 10.w,
                                ),
                                SizedBox(
                                  height: 42.h,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Lộ trình học',
                                        style: defaultText14B,
                                      ),
                                      Text(
                                        '60 buổi',
                                        style: defaultText14Re.copyWith(
                                          color: key1Color.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 166.w,
                            height: 86.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ]),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                SvgPicture.asset('assets/icons/subcriber.svg'),
                                SizedBox(
                                  width: 10.w,
                                ),
                                SizedBox(
                                  height: 42.h,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Đã đăng ký',
                                        style: defaultText14B,
                                      ),
                                      Text(
                                        '312 người',
                                        style: defaultText14Re.copyWith(
                                          color: key1Color.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Mô tả',
                        style: defaultText18B,
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Just gonna stand there anh watch me burn',
                              style: defaultText14Re,
                              maxLines: isExpanded ? 11 : 4,
                              softWrap: true,
                              // overflow: TextOverflow.fade,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          'Một người như thế đấy yêu là yêu đến hết đời này, em không là thế giới ấy em thật là nhỏ bé thôi tại sao em mãi cứ ôm mãi không bao giờ nói ra có lẽ em yêu anh nhiều quá nên là em chẳng dám buông ra có lẽ anh thấy em mạnh mẽ nên là anh chẳng muốn vỗ về'
                                      .length <
                                  197
                              ? const SizedBox()
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      isExpanded == false
                                          ? 'Xem thêm'
                                          : 'Rút gọn',
                                      style: defaultText16B.copyWith(
                                          color: main1Color),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Lịch khai giảng',
                        style: defaultText18M,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Đánh giá từ học viên',
                        style: defaultText18M,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 350.w,
                        height: 157.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 84.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
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
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20.w,
                      ),
                      Text(
                        'Học phí',
                        style: defaultText14M,
                      ),
                      Text(
                        '4.500.000 VND',
                        style: defaultText20B.copyWith(
                          color: main1Color,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 43.h,
                    width: 122.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36.r),
                      gradient: mainGradient,
                    ),
                    child: Center(
                      child: Text(
                        'Đăng ký ngay',
                        style: defaultText14B.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
