import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/student_models/lichthi_models.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/custom_widget.dart';

class LichHocScreen extends StatelessWidget {
  const LichHocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SingleChildScrollView(
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
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: key1Color.withOpacity(0.1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.r),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                'Phòng học',
                                style: defaultText14Re,
                              ),
                            ),
                            Text(
                              'P101 - Giáo viên 1',
                              style: defaultText14B,
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                'Nội dung',
                                style: defaultText14Re,
                              ),
                            ),
                            Text(
                              'Bài học 1',
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
                child: const LichhocTabBar(
                  listLichthi: [],
                )),
            // const Lesson(
            //   title1: '',
            //   title2: '',
            //   title3: '',
            // ),
          ],
        ),
      ),
    );
  }
}

class LichhocTabBar extends StatefulWidget {
  const LichhocTabBar({super.key, required this.listLichthi});

  final List<LichCuaToiModels> listLichthi;
  @override
  State<LichhocTabBar> createState() => _LichhocTabBarState();
}

class _LichhocTabBarState extends State<LichhocTabBar>
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
    // bỏ comment cái dưới và cmt cái này nhé
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  // height: 182.h,
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
                          offset:
                              const Offset(0, 2), // changes position of shadow
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
                            //height: 70.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              gradient: mainGradient2,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: (Text(
                                '21\nTháng 5 ',
                                style: defaultText16B.copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              )),
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
                                'Thi thử - tháng 9',
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
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: key1Color.withOpacity(0.1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.r),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 80.w,
                                  child: Text(
                                    'Cơ sở',
                                    style: defaultText14Re,
                                  ),
                                ),
                                Text(
                                  'P101 - Giáo viên 1',
                                  style: defaultText14B,
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80.w,
                                  child: Text(
                                    'Hình thức',
                                    style: defaultText14Re,
                                  ),
                                ),
                                Text(
                                  'Offline',
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
                    ],
                  ),
                );
              }),
        ],
      ),
    );
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: <Widget>[
    // TabBar.secondary(
    //   tabAlignment: TabAlignment.start,
    //   padding: EdgeInsets.zero,
    //   indicatorPadding: EdgeInsets.zero,
    //   labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
    //   isScrollable: true,
    //   indicatorColor: keyBlack,
    //   indicatorSize: TabBarIndicatorSize.label,
    //   indicator: UnderlineTabIndicator(
    //     borderSide: BorderSide(width: 2.w), //hight of indicator
    //     insets: EdgeInsets.symmetric(
    //         horizontal:
    //             20.w), //give some padding to reduce the size of indicator
    //   ),
    //   unselectedLabelColor: keyBlack.withOpacity(0.3),
    //   labelColor: keyBlack,
    //   controller: _tabController,
    //   tabs: <Widget>[
    //     homeTab(title: 'Sắp tới', isSeprator: false,hasNumber: false,),
    //     homeTab(title: 'Đã tham gia',hasNumber: false),
    //   ],
    // ),
    // Expanded(
    //   child: TabBarView(
    //     controller: _tabController,
    //     children: <Widget>[
    //       Column(
    //         children: [
    //           Container(
    //             margin:
    //                 EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    //            // height: 182.h,
    //             width: 349.w,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.all(
    //                   Radius.circular(8.r),
    //                 ),
    //                 color: Colors.white,
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.grey.withOpacity(0.2),
    //                     spreadRadius: 5,
    //                     blurRadius: 7,
    //                     offset: const Offset(
    //                         0, 2), // changes position of shadow
    //                   ),
    //                 ]),
    //             child: Column(
    //               //mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 SizedBox(
    //                   height: 10.h,
    //                 ),
    //                 Row(
    //                   children: [
    //                     SizedBox(
    //                       width: 10.w,
    //                     ),
    //                     Container(
    //                       //height: 70.h,
    //                       width: 70.w,
    //                       decoration: BoxDecoration(
    //                         gradient: mainGradient2,
    //                         borderRadius: BorderRadius.all(
    //                           Radius.circular(12.r),
    //                         ),
    //                       ),
    //                       child: Padding(
    //                         padding:  EdgeInsets.symmetric(vertical: 10.h),
    //                         child: (Text(
    //                           '21\nTháng 5 ',
    //                           style: defaultText16B.copyWith(
    //                             color: Colors.white,
    //                           ),
    //                           textAlign: TextAlign.center,
    //                         )),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       width: 15.w,
    //                     ),
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       mainAxisAlignment:
    //                           MainAxisAlignment.spaceAround,
    //                       children: [
    //                         Text(
    //                           'Thi thử - tháng 9',
    //                           style: defaultText16B,
    //                         ),
    //                         Text(
    //                           '21/05/2024',
    //                           style: defaultText14Re,
    //                         ),
    //                         Text(
    //                           '08:00 - 11:00 ~ 3 tiếng',
    //                           style: defaultText14Re,
    //                         ),
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   height: 10.h,
    //                 ),
    //                 Container(
    //                   height: 74.h,
    //                   width: 325.w,
    //                   padding: EdgeInsets.symmetric(horizontal: 10.w),
    //                   decoration: BoxDecoration(
    //                     color: key1Color.withOpacity(0.1),
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(8.r),
    //                     ),
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Row(
    //                         children: [
    //                           SizedBox(
    //                             width: 80.w,
    //                             child: Text(
    //                               'Cơ sở',
    //                               style: defaultText14Re,
    //                             ),
    //                           ),
    //                           Text(
    //                             'P101 - Giáo viên 1',
    //                             style: defaultText14B,
    //                           ),
    //                         ],
    //                       ),
    //                       const Divider(
    //                         color: Colors.white,
    //                         thickness: 2,
    //                       ),
    //                       Row(
    //                         children: [
    //                           SizedBox(
    //                             width: 80.w,
    //                             child: Text(
    //                               'Hình thức',
    //                               style: defaultText14Re,
    //                             ),
    //                           ),
    //                           Text(
    //                             'Offline',
    //                             style: defaultText14B,
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 10.h,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //       Column(
    //         children: [
    //           Container(
    //             margin:
    //                 EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    //             width: 349.w,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.all(
    //                   Radius.circular(8.r),
    //                 ),
    //                 color: Colors.white,
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.grey.withOpacity(0.2),
    //                     spreadRadius: 5,
    //                     blurRadius: 7,
    //                     offset: const Offset(
    //                         0, 2), // changes position of shadow
    //                   ),
    //                 ]),
    //             child: Column(
    //               //mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 SizedBox(
    //                   height: 10.h,
    //                 ),
    //                 Row(
    //                   children: [
    //                     SizedBox(
    //                       width: 10.w,
    //                     ),
    //                     Container(
    //                       height: 70.h,
    //                       width: 70.w,
    //                       decoration: BoxDecoration(
    //                         color: key1Color.withOpacity(0.3),
    //                         borderRadius: BorderRadius.all(
    //                           Radius.circular(12.r),
    //                         ),
    //                       ),
    //                       child: (Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           Text(
    //                             '21\nTháng 5 ',
    //                             style: defaultText16B.copyWith(
    //                               color: Colors.white,
    //                             ),
    //                             textAlign: TextAlign.center,
    //                           ),
    //                         ],
    //                       )),
    //                     ),
    //                     SizedBox(
    //                       width: 15.w,
    //                     ),
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       mainAxisAlignment:
    //                           MainAxisAlignment.spaceAround,
    //                       children: [
    //                         Text(
    //                           'Thi thử - tháng 9',
    //                           style: defaultText16B,
    //                         ),
    //                         Text(
    //                           '21/05/2024',
    //                           style: defaultText14Re,
    //                         ),
    //                         Text(
    //                           '08:00 - 11:00 ~ 3 tiếng',
    //                           style: defaultText14Re,
    //                         ),
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   height: 10.h,
    //                 ),
    //                 Container(
    //                   height: 74.h,
    //                   width: 325.w,
    //                   padding: EdgeInsets.symmetric(horizontal: 10.w),
    //                   decoration: BoxDecoration(
    //                     color: key1Color.withOpacity(0.1),
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(8.r),
    //                     ),
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Row(
    //                         children: [
    //                           SizedBox(
    //                             width: 80.w,
    //                             child: Text(
    //                               'Cơ sở',
    //                               style: defaultText14Re,
    //                             ),
    //                           ),
    //                           Text(
    //                             'P101 - Giáo viên 1',
    //                             style: defaultText14B,
    //                           ),
    //                         ],
    //                       ),
    //                       const Divider(
    //                         color: Colors.white,
    //                         thickness: 2,
    //                       ),
    //                       Row(
    //                         children: [
    //                           SizedBox(
    //                             width: 80.w,
    //                             child: Text(
    //                               'Hình thức',
    //                               style: defaultText14Re,
    //                             ),
    //                           ),
    //                           Text(
    //                             'Offline',
    //                             style: defaultText14B,
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 10.h,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // ),
    //   ],
    // );
  }
}
