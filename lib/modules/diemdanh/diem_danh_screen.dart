import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/modules/diemdanh/attendance_details.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:d_chart/d_chart.dart';

class DiemDanhScreen extends StatelessWidget {
  const DiemDanhScreen({super.key});

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
                          'Điểm danh ',
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
                    'assets/images/diem_danh.png',
                    width: 118.w,
                    height: 116.h,
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
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AttendanceDetails(),
                        ),
                      );
                    },
                    child: Noti(
                      index: index,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class Noti extends StatelessWidget {
  const Noti({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.w),
      height: 166.h,
      width: 350.w,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: state2),
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
      child: SizedBox(
        width: 330.w,
        child: Row(
          children: [
            SizedBox(
              height: 160.h,
              width: 160.w,
              child: const PieChart(),
            ),
            SizedBox(
              height: 151.h,
              width: 160.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'TOEIC 4 kỹ năng ',
                    style: defaultText16B,
                  ),
                  Divider(
                    thickness: 1,
                    // indent: 15.w,
                    // endIndent: 15.w,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lớp',
                        style: defaultText12Re,
                      ),
                      Text(
                        'TTH4',
                        style: defaultText12B,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bắt đầu',
                        style: defaultText12Re,
                      ),
                      Text(
                        '07/05/2024',
                        style: defaultText12B,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kết thúc',
                        style: defaultText12Re,
                      ),
                      Text(
                        '07/10/2024',
                        style: defaultText12B,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tham gia',
                        style: defaultText14B.copyWith(color: main1Color),
                      ),
                      Text(
                        '24/40',
                        style: defaultText14B.copyWith(color: main1Color),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Vắng',
                        style: defaultText14B.copyWith(color: sub2Color),
                      ),
                      Text(
                        '1/40',
                        style: defaultText14B.copyWith(color: sub2Color),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    List<OrdinalData> ordinalDataList = [
      OrdinalData(domain: 'tg', measure: 24, color: main1Color),
      OrdinalData(domain: 'v', measure: 1, color: sub2Color),
      OrdinalData(domain: 'c', measure: 15, color: state2),
    ];
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: DChartPieO(
            data: ordinalDataList,
            customLabel: (ordinalData, index) {
              return "${ordinalData.domain}:${ordinalData.measure}";
            },
            configRenderPie: ConfigRenderPie(
              arcLabelDecorator: ArcLabelDecorator(
                labelPosition: ArcLabelPosition.auto,
                leaderLineStyle: const ArcLabelLeaderLineStyle(
                  color: Colors.transparent,
                  length: 30,
                  thickness: 0,
                ),
                showLeaderLines: true,
              ),
              arcLength: 2 * pi,
              arcRatio: 0.2,
              //arcWidth: 10,
              startAngle: -pi / 2,
              strokeWidthPx: 0,
            ),
          ),
        ),
        Center(
          child: Text(
            '70%',
            style: defaultText20B,
          ),
        ),
      ],
    );
  }
}
