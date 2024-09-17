import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 160.h,
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
                  left: 22.w,
                  child: Text(
                    'Tin tức PMP ENGLISH ',
                    style: defaultText20B.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.h,
                  left: 250.w,
                  child: Image.asset(
                    'assets/images/news.png',
                    width: 133.w,
                    height: 125.h,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return CourseItem(
                    index: index,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w),
      height: 93.h,
      width: 350.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ClipRRect(
          //   borderRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(16),
          //     topRight: Radius.circular(16),
          //   ),
          //   child: Image.asset('assets/images/course_image.png'),
          // ),

          Container(
            height: 93.h,
            width: 103.w,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                color: main2Color),
            child: Center(
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          SizedBox(
            height: 93.h,
            width: 227.w,
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 60.h,
                  child: Text(
                    '[Quan trọng] Thông báo nghỉ lễ từ  30/8 đến 1/9',
                    style: defaultText14B,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Thông báo chung',
                      style: defaultText12Re,
                    ),
                    Text(
                      '21.07.2024',
                      style: defaultText12Re,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
    );
  }
}
