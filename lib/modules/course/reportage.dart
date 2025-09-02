import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/student_models/my_course_model.dart';
import 'package:pmp_english/student_models/review_models.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/custom_widget.dart';

class ReportageScreen extends StatelessWidget {
  const ReportageScreen({super.key, required this.detailBaoCao});
  final DetailBaoCaoModel detailBaoCao;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Đánh giá tổng quan',
            style: defaultText16B,
          ),
        ),
        SizedBox(height: 10.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: chartItem(
            width: 350,
            percents: detailBaoCao.chuyenCan,
            title: 'Chuyên cần',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: chartItem(
            width: 350,
            percents: detailBaoCao.baiTap,
            title: 'Bài tập',
          ),
        ),

        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Liên hệ giảng viên',
            style: defaultText16B,
          ),
        ),
        SizedBox(height: 10.h),

        // Ví dụ chỗ này nếu cần
        // ConversationItem(
        //   index: 1,
        //   title1: detailBaoCao.fullName,
        //   title2: detailBaoCao.content,
        // ),

        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Nhận xét',
            style: defaultText16B,
          ),
        ),
        SizedBox(height: 10.h),

        // Dùng ListView.separated để có Divider ngăn block
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // chỉ render
          itemCount: detailBaoCao.monthlyReview.length,
          itemBuilder: (BuildContext context, int index) {
            return _FeedbackItem(detailBaoCao.monthlyReview[index]);
          },
          // separatorBuilder: (context, index) => Divider(
          //   height: 20,
          //   indent: 20.w,
          //   endIndent: 20.w,
          //   thickness: 1,
          // ),
        )
      ],
    );
  }
}

class _FeedbackItem extends StatelessWidget {
  const _FeedbackItem(this.model);
  final ReviewDetailModels model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      margin: EdgeInsets.only(bottom: 16.h, left: 20.w, right: 20.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ]),
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 12.w, 12.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.monthName,
            style: defaultText14B,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Giáo viên :${model.teacherName}',
            style: defaultText14B,
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: model.listValue.length,
            itemBuilder: (BuildContext context, int index) {
              final item = model.listValue[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 16.w,
                ),
                child: Text(
                  '${item.name}${item.type == '2' ? ' :\n${item.value}' : ''}',
                  style: item.type == '1'
                      ? defaultText14M
                      : defaultText16B.copyWith(
                          color: item.type == '0' ? main1Color : key1Color,
                        ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
// Ví khóa học
// GestureDetector(
          //   onTap: () async {
          //     InfoDiemDanh infoModel =
          //         await DiemdanhRepo().getDetailDiemDanh('1');
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => AttendanceDetails(
          //           infoModel: infoModel,
          //         ),
          //       ),
          //     );
          //   },
          //   child: Container(
          //     width: 350.w,
          //     //height: 208.h,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8.r),
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withValues(alpha: 0.2),
          //           spreadRadius: 5,
          //           blurRadius: 7,
          //           offset: const Offset(0, 2), // changes position of shadow
          //         ),
          //       ],
          //     ),
          //     child: Column(
          //       children: [
          //         SizedBox(
          //           height: 10.h,
          //         ),
          //         Container(
          //           width: 320.w,
          //           height: 36.h,
          //           decoration: BoxDecoration(
          //             color: key2Color,
          //             borderRadius: BorderRadius.circular(4.r),
          //           ),
          //           child: Row(
          //             children: [
          //               SizedBox(
          //                 width: 10.w,
          //               ),
          //               Text(
          //                 'Ví khóa học',
          //                 style: defaultText16B.copyWith(color: Colors.white),
          //               ),
          //               const Spacer(),
          //               Text(
          //                 '24.000.000 VND',
          //                 style: defaultText16B.copyWith(color: Colors.white),
          //               ),
          //               SizedBox(
          //                 width: 10.w,
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(
          //           height: 168.h,
          //           child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Column(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   SizedBox(
          //                     height: 100.h,
          //                     width: 100.h,
          //                     child: const PieChart(
          //                       percent: 70,
          //                       attended: '30',
          //                       abstract: '5',
          //                       total: '50',
          //                     ),
          //                   ),
          //                   Text(
          //                     'Đã học',
          //                     style: defaultText14M,
          //                   ),
          //                   Text(
          //                     '24',
          //                     style: defaultText16B,
          //                   ),
          //                 ],
          //               ),
          //               SizedBox(
          //                 width: 20.w,
          //               ),
          //               Column(
          //                 children: [
          //                   SizedBox(
          //                     height: 20.h,
          //                   ),
          //                   Text(
          //                     'Tổng số buổi',
          //                     style: defaultText14M,
          //                   ),
          //                   Text(
          //                     '40',
          //                     style: defaultText14M,
          //                   ),
          //                   const Spacer(),
          //                   Text(
          //                     'Vắng mặt',
          //                     style: defaultText14M,
          //                   ),
          //                   Text(
          //                     '2',
          //                     style: defaultText14M,
          //                   ),
          //                   SizedBox(
          //                     height: 20.h,
          //                   ),
          //                 ],
          //               ),
          //               SizedBox(
          //                 width: 40.w,
          //               ),
          //               Column(
          //                 children: [
          //                   SizedBox(
          //                     height: 20.h,
          //                   ),
          //                   Text(
          //                     'Còn lại',
          //                     style: defaultText14M,
          //                   ),
          //                   Text(
          //                     '16',
          //                     style: defaultText14M,
          //                   ),
          //                   const Spacer(),
          //                   Text(
          //                     'Xin nghỉ',
          //                     style: defaultText14M,
          //                   ),
          //                   Text(
          //                     '1',
          //                     style: defaultText14M,
          //                   ),
          //                   SizedBox(
          //                     height: 20.h,
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )