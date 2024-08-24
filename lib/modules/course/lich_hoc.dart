import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/custom_widget.dart';

class LichHocScreen extends StatelessWidget {
  const LichHocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lịch học gần nhất',
            style: defaultText16B,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '21',
                            style: defaultText20B.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Tháng 5',
                            style: defaultText16M.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      height: 70.h,
                      child: Column(
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
                      ),
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
                    color: key1Color.withOpacity(0.1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phòng học',
                            style: defaultText14Re,
                          ),
                          Text(
                            'Nội dung',
                            style: defaultText14Re,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'P101 - Giáo viên 1',
                            style: defaultText14B,
                          ),
                          Text(
                            'Lorem ipsum',
                            style: defaultText14B,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 12.w,
                    ),
                    Container(
                      height: 14.h,
                      width: 14.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      'Chưa điểm danh',
                      style: defaultText14M,
                    ),
                    SizedBox(
                      width: 80.w,
                    ),
                    Container(
                      height: 29.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: sub2Color,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Xin nghỉ',
                          style: defaultText14B.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            'Thời khóa biểu',
            style: defaultText16B,
          ),
          SizedBox(
              height: 330.h,
              width: 390.w,
              child: const NestedTabBar('Flights')),
          // const Lesson(
          //   title1: '',
          //   title2: '',
          //   title3: '',
          // ),
        ],
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TabBar.secondary(
          tabAlignment: TabAlignment.start,
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
          isScrollable: true,
          indicatorColor: keyBlack,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.w), //hight of indicator
            insets: EdgeInsets.symmetric(
                horizontal:
                    20.w), //give some padding to reduce the size of indicator
          ),
          unselectedLabelColor: keyBlack.withOpacity(0.3),
          labelColor: keyBlack,
          controller: _tabController,
          tabs: <Widget>[
            homeTab(title: 'Sắp tới', isSeprator: false),
            homeTab(title: 'Đã xong'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const Lesson(title1: '', title2: '', title3: '');
                  }),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(
                    child: Text('${widget.outerTab}: Specifications tab')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
