import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/l10n/l10n.dart';
import 'package:pmp_english/modules/diemdanh/attendance_details.dart';
import 'package:pmp_english/student_repo/diemdanh_repo.dart';
import 'package:pmp_english/student_models/diem_danh_model.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:d_chart/d_chart.dart';

class DiemDanhScreen extends StatelessWidget {
  const DiemDanhScreen({super.key, required this.listDiemdanh});
  final List<DiemDanhModel> listDiemdanh;
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
                          Icons.arrow_back_ios_new,
                          size: 30.h,
                          color: Colors.white,
                        ),
                        Text(
                          '\t${L10n.of(context).diemdanh}',
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
                itemCount: listDiemdanh.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      InfoDiemDanh infoModel = await DiemdanhRepo()
                          .getDetailDiemDanh(listDiemdanh[index].id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AttendanceDetails(
                            infoModel: infoModel,
                          ),
                        ),
                      );
                    },
                    child: _Noti(
                      index: index,
                      model: listDiemdanh[index],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class _Noti extends StatelessWidget {
  const _Noti({required this.index, required this.model});
  final int index;
  final DiemDanhModel model;
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
              child: PieChart(
                percent: model.percentage,
                attended: model.totalAttended,
                abstract: model.totalAbsent,
                total: model.total,
              ),
            ),
            SizedBox(
              height: 151.h,
              width: 160.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    model.courseName,
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
                        L10n.of(context).lophoc,
                        style: defaultText12Re,
                      ),
                      Text(
                        model.alias,
                        style: defaultText12B,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        L10n.of(context).start,
                        style: defaultText12Re,
                      ),
                      Text(
                        model.startDate,
                        style: defaultText12B,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        L10n.of(context).end,
                        style: defaultText12Re,
                      ),
                      Text(
                        model.expiryDate,
                        style: defaultText12B,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        L10n.of(context).join,
                        style: defaultText14B.copyWith(color: main1Color),
                      ),
                      Text(
                        '${model.totalAttended}/${model.total}',
                        style: defaultText14B.copyWith(color: main1Color),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        L10n.of(context).absent,
                        style: defaultText14B.copyWith(color: sub2Color),
                      ),
                      Text(
                        '${model.totalAbsent}/${model.total}',
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
  const PieChart(
      {super.key,
      required this.percent,
      required this.attended,
      required this.abstract,
      required this.total});
  final int percent;
  final String attended;
  final String abstract;
  final String total;
  @override
  Widget build(BuildContext context) {
    List<OrdinalData> ordinalDataList = [
      OrdinalData(domain: '1', measure: int.parse(attended), color: main1Color),
      OrdinalData(domain: '2', measure: int.parse(abstract), color: sub2Color),
      OrdinalData(
          domain: '3',
          measure: int.parse(total) - int.parse(attended) - int.parse(abstract),
          color: state2),
    ];
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: DChartPieO(
            data: ordinalDataList,
            customLabel: (ordinalData, index) {
              return "";
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
        // Center(
        //   child: Text(
        //     '$percent%',
        //     style: defaultText20B,
        //   ),
        // ),
      ],
    );
  }
}
