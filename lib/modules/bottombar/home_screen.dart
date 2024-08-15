import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 390.w,
            height: 250.h,
            decoration: BoxDecoration(gradient: mainGradient),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.brown.shade800,
                        radius: 24,
                        child: const Text('HA'),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chào mừng trở lại !',
                            style:
                                defaultText14Re.copyWith(color: Colors.white),
                          ),
                          Text(
                            'Nguyễn Hồng Anh',
                            style: defaultText18B.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Container(
                        height: 37.h,
                        width: 37.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: main2Color,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 37.h,
                        width: 37.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: main2Color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 247.w,
                        height: 90.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.r),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.w, 6.h, 20.w, 6.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Khóa học đã mua',
                                    style: defaultText12Re,
                                  ),
                                  Text(
                                    '30',
                                    style: defaultText14M,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              indent: 16.w,
                              endIndent: 16.w,
                              thickness: 1,
                              color: Colors.black,
                              height: 1,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 6.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Mục tiêu',
                                    style: defaultText12Re,
                                  ),
                                  Text(
                                    'Mục tiêu',
                                    style: defaultText12Re,
                                  ),
                                  Text(
                                    'Mục tiêu',
                                    style: defaultText12Re,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      _stackDiemDanh(),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _homeIcon(title: 'Lịch thi', image: 'assets/images/lich_thi.png'),
              _homeIcon(title: 'Bài tập', image: 'assets/images/bai_tap.png'),
              _homeIcon(
                  title: 'Báo cáo điểm',
                  image: 'assets/images/bao_cao_diem.png'),
              _homeIcon(title: 'Đánh giá', image: 'assets/images/danh_gia.png'),
            ],
          ),
          // Học phí
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          //   height: 44.h,
          //   width: 349.w,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(
          //         Radius.circular(8.r),
          //       ),
          //       color: sub2Color),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Text(
          //         'Học phí chờ thanh toán',
          //         style: defaultText16M.copyWith(color: Colors.white),
          //       ),
          //       const SizedBox(
          //         width: 1,
          //       ),
          //       Text(
          //         '3.345.000đ',
          //         style: defaultText16M.copyWith(color: Colors.white),
          //       ),
          //     ],
          //   ),
          // ),
          Text(
            'Lịch học gần nhất',
            style: defaultText16B,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            height: 222.h,
            width: 349.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ]),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
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
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
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
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 74.h,
                  width: 325.w,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//icon cứ tràn ra ngoài rất là khó chịu
//lại 1 cái custom widget để render mặc kệ hiệu năng

Widget _stackDiemDanh({bool diemdanh = true}) {
  return SizedBox(
    height: 102.h,
    width: 93.w,
    child: Stack(
      children: [
        Positioned(
          top: 3,
          left: 0,
          child: Container(
            width: 90.w,
            height: 90.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 8.w,
          child: Image.asset(
            'assets/images/diem_danh.png',
            width: 76.w,
            height: 75.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 6.h,
          left: 8.w,
          child: Text(
            'Điểm danh',
            style: defaultText14B.copyWith(
              color: key2Color,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: (diemdanh == true)
              ? Container(
                  width: 10.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                    color: sub2Color,
                  ),
                )
              : const SizedBox(),
        ),
      ],
    ),
  );
}

Widget _homeIcon({required String title, required String image}) {
  return SizedBox(
    height: 96.h,
    width: 80.w,
    child: Column(
      children: [
        SizedBox(
          height: 65.h,
          width: 65.w,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 62.h,
                  width: 62.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, gradient: mainGradient2),
                ),
              ),
              Center(
                  child: Image.asset(
                image,
                width: 65.w,
                height: 62.h,
                fit: BoxFit.fill,
              )),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Center(
          child: Text(
            title,
            style: defaultText12M,
          ),
        ),
      ],
    ),
  );
}
