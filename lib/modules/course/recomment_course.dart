import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:pmp_english/student_models/customer_models.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class RecommentCourse extends StatefulWidget {
  const RecommentCourse({super.key, required this.model});
  final DetailRcmCourse model;
  @override
  State<RecommentCourse> createState() => _RecommentCourseState();
}

class _RecommentCourseState extends State<RecommentCourse>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  late RecommentCourseModel _rcmModel;
  late List<LichKhaiGiangModel> listLichKg;
  @override
  void initState() {
    super.initState();
    _rcmModel = widget.model.recommentCourse;
    listLichKg = widget.model.listLichKhaiGiang;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 259.h,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          child: SizedBox(
                            child: Image.network(
                              'https://lms.pmpenglish.edu.vn/images/${_rcmModel.img}',
                              width: 390.w,
                              height: 259.h,
                              //fit: BoxFit.cover,
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
                          _rcmModel.name,
                          style: defaultText20B,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          _rcmModel.categoryName,
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Lộ trình học',
                                        style: defaultText14B,
                                      ),
                                      Text(
                                        '${_rcmModel.soBuoiHoc} buổi',
                                        style: defaultText14Re.copyWith(
                                          color:
                                              key1Color.withValues(alpha: 0.9),
                                        ),
                                      ),
                                    ],
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
                                  SvgPicture.asset(
                                      'assets/icons/subcriber.svg'),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Đã đăng ký',
                                        style: defaultText14B,
                                      ),
                                      Text(
                                        '${_rcmModel.daDangKy} người',
                                        style: defaultText14Re.copyWith(
                                          color:
                                              key1Color.withValues(alpha: 0.9),
                                        ),
                                      ),
                                    ],
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
                        SizedBox(
                          height: 6.h,
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                _rcmModel.descriptioin,
                                style: defaultText14Re,
                                maxLines: isExpanded ? 11 : 4,
                                softWrap: true,
                                // overflow: TextOverflow.fade,
                              ),
                            ),
                            _rcmModel.descriptioin.length < 197
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
                                        style: defaultText14B.copyWith(
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
                          height: 180.h,
                          width: 390.w,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listLichKg.length,
                              physics: const ClampingScrollPhysics(),
                              // itemExtent: 160.h,
                              itemBuilder: (BuildContext context, int index) {
                                return LichKhaiGiangItem(
                                  model: listLichKg[index],
                                );
                              }),
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
                        // Container(
                        //   width: 350.w,
                        //   height: 157.h,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Colors.grey.withOpacity(0.2),
                        //         spreadRadius: 5,
                        //         blurRadius: 7,
                        //         offset: const Offset(
                        //             0, 2), // changes position of shadow
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 84.h,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Học phí',
                            style: defaultText14M,
                          ),
                          Text(
                            '${formatCurrency(_rcmModel.price)} VND',
                            style: defaultText20B.copyWith(
                              color: main1Color,
                            ),
                          ),
                        ]),
                    GestureDetector(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Đăng ký thành công',
                                style: defaultText14M,
                              ),
                              content: Text(
                                'Nhân viên tư vấn sẽ liên hệ với bạn trong thời gian sớm nhất',
                                style: defaultText14M,
                              ),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
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
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LichKhaiGiangItem extends StatelessWidget {
  const LichKhaiGiangItem({super.key, required this.model});
  final LichKhaiGiangModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          right: 20.w,
          left: 10.w,
          top: 5.h,
          bottom: 5.h,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
          color: Colors.white,
        ),
        //height: 145.h,
        width: 317.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 120.w,
                  child: Text('Mã lớp', style: defaultText12M),
                ),
                SizedBox(
                  width: 160.w,
                  child: Text('Khai giảng', style: defaultText12M),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 120.w,
                  child: Text(
                    model.alias,
                    style: defaultText14B.copyWith(color: main1Color),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: Text(
                    model.dateStart,
                    style: defaultText14B.copyWith(color: main1Color),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 120.w,
                  child: Text('Lịch học', style: defaultText12M),
                ),
                SizedBox(
                  width: 160.w,
                  child: Text('Cơ sở', style: defaultText12M),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120.w,
                  child: HtmlWidget(
                    model.note,
                    textStyle: defaultText14B.copyWith(color: main1Color),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: Text(
                    model.cosoName,
                    style: defaultText14B.copyWith(color: main1Color),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.black, thickness: 1),
            Row(
              children: [
                SizedBox(
                  width: 120.w,
                  child: Text('Tổng số chỗ', style: defaultText12M),
                ),
                SizedBox(
                  width: 160.w,
                  child: Text(
                    model.totalSlot,
                    style: defaultText14B.copyWith(color: key1Color),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 120.w,
                  child: Text('Đã đăng ký', style: defaultText12M),
                ),
                SizedBox(
                  width: 160.w,
                  child: Text(
                    model.totalDk,
                    style: defaultText14B.copyWith(color: key1Color),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

String formatCurrency(String numberString) {
  final number = int.tryParse(numberString.replaceAll('.', '')) ?? 0;
  final formatter = NumberFormat.decimalPattern('vi_VN');
  return formatter.format(number);
}
