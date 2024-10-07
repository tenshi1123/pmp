import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/modules/course/lich_hoc.dart';
import 'package:pmp_english/modules/course/reportage.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

import 'excercise_screen.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _tabs = [
    const Tab(text: 'Lịch học'),
    const Tab(text: 'Bài tập'),
    const Tab(text: 'Báo cáo'),
  ];
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            const AssetImage("assets/images/course_image.png"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 114.h,
                  left: 20.h,
                  child: Container(
                    width: 350.w,
                    height: 66.h,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ]),
                    child: TabBar(
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: mainGradient2),
                      labelStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: _tabs,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 70.h,
                  left: 22.w,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      Text(
                        'TOEIC 4 kỹ năng',
                        style: defaultText20B.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                LichHocScreen(),
                ExcerciseScreen(),
                ReportageScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
