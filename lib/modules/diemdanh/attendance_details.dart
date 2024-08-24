import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/modules/diemdanh/diem_danh_screen.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class AttendanceDetails extends StatelessWidget {
  const AttendanceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   title: Text('Chi tiết điểm danh',
      //       textAlign: TextAlign.right,
      //       style: defaultText20B.copyWith(color: Colors.white)),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50.h,
                width: 390.w,
                decoration: BoxDecoration(gradient: mainGradient),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text('Chi tiết điểm danh',
                        textAlign: TextAlign.right,
                        style: defaultText20B.copyWith(color: Colors.white)),

                    //SvgPicture.asset('assets/icons/three_dots_icon.svg'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 20.h),
                child: Text(
                  'TOEIC 4 kỹ năng ',
                  style: defaultText16B,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 120.h,
                    width: 120.w,
                    child: const PieChart(),
                  ),
                  SizedBox(
                    height: 90.h,
                    width: 130.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
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
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  SizedBox(
                    height: 90.h,
                    width: 100.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tham gia',
                              style: defaultText14Re,
                            ),
                            Container(
                              height: 17.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                gradient: mainGradient,
                              ),
                              child: Center(
                                child: Text(
                                  '26',
                                  style: defaultText14B.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Vắng',
                              style: defaultText14Re,
                            ),
                            Container(
                              height: 17.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                color: sub2Color,
                              ),
                              child: Center(
                                child: Text(
                                  '1',
                                  style: defaultText14B.copyWith(
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Chưa học',
                              style: defaultText14Re,
                            ),
                            Container(
                              height: 17.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                color: key1Color.withOpacity(0.3),
                              ),
                              child: Center(
                                child: Text(
                                  '13',
                                  style: defaultText14B.copyWith(
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _tabSection(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _tabSection(
  BuildContext context,
) {
  return DefaultTabController(
    length: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TabBar(
            unselectedLabelColor: keyBlack.withOpacity(0.3),
            labelColor: main1Color,
            labelStyle: defaultText14B,
            indicatorColor: main1Color,
            //indicatorSize: TabBarIndicatorSize(),
            tabs: [
              homeTab(
                title: "Đã qua",
                isSeprator: false,
              ),
              homeTab(
                title: "Sắp tới",
              ),
            ]),
        SizedBox(
          //Add this to give height
          height: MediaQuery.of(context).size.height * 0.8,
          child: TabBarView(children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return CaseStudy(
                    index: index,
                    isCompleted: true,
                  );
                }),
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return CaseStudy(
                    index: index,
                    isCompleted: false,
                  );
                }),
          ]),
        ),
      ],
    ),
  );
}

Widget homeTab(
    {required String title,
    bool isSeprator = true,
    bool hasNumber = true,
    int count = 0}) {
  return Tab(
    child: Container(
      // width: 130.w,
      height: 20,
      decoration: isSeprator
          ? const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
          ),
          hasNumber
              ? Container(
                  decoration: BoxDecoration(
                    color: keyBlack,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  height: 20.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  margin: EdgeInsets.only(left: 8.h),
                  child: Center(
                    child: Text(
                      '10',
                      style: defaultText12B.copyWith(color: Colors.white),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    ),
  );
}

class CaseStudy extends StatelessWidget {
  const CaseStudy({super.key, required this.index, required this.isCompleted});
  final int index;
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: 390.w,
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(width: 20.w),
              SizedBox(
                height: 60.h,
                width: 90.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0${index + 1}/05/2024',
                      style: defaultText14B,
                    ),
                    const Spacer(),
                    Text(
                      'Ca học',
                      style: defaultText14Re,
                    ),
                    Text(
                      'Giảng viên',
                      style: defaultText14Re,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              SizedBox(
                height: 60.h,
                width: 90.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      '08:00 - 11:00',
                      style: defaultText14B,
                    ),
                    Text(
                      'Nguyễn Phú',
                      style: defaultText14B,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Image.asset(
                !isCompleted
                    ? 'assets/images/iscomming.png'
                    : index == 0
                        ? 'assets/images/miss.png'
                        : 'assets/images/complete.png',
                width: 36.w,
                height: 36.h,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 20.w,
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            thickness: 1,
            indent: 15.w,
            endIndent: 15.w,
            height: 1,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
