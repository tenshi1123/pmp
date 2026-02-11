import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/modules/bottombar/screen/home_widgets.dart';
import 'package:pmp_english/student_models/customer_models.dart';
import 'package:pmp_english/utils/constants/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.infomodel,
  });
  final StudentHomeModel infomodel;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StudentHomeModel infomodel;
  @override
  void initState() {
    infomodel = widget.infomodel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 390.w,
            decoration: BoxDecoration(gradient: mainGradient),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  HomeHeader(infomodel: infomodel),
                  SizedBox(
                    height: 30.h,
                  ),
                  HomeStats(infomodel: infomodel),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          const HomeMenuIcons(),
          SizedBox(
            height: 30.h,
          ),
          HomeUpcomingSchedule(infomodel: infomodel),
          HomeSuggestedCourses(infomodel: infomodel),
        ],
      ),
    );
  }
}
