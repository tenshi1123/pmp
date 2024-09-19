import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:number_paginator/number_paginator.dart';

extension Substrings on String {
  /// Drops the last n characters.
  String dropLast(int n) {
    return n > length ? "" : substring(0, length - n);
  }
}

class TestDetailScreen extends StatefulWidget {
  const TestDetailScreen({
    super.key,
  });

  @override
  State<TestDetailScreen> createState() => _TestDetailScreenState();
}

class _TestDetailScreenState extends State<TestDetailScreen> {
  //int _currentPage = 1;
  //@override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Pagination Example"),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             height: 200,
  //             margin: const EdgeInsets.all(32),
  //             color: Colors.blue,
  //             child: Center(
  //               child: Text(
  //                 "PAGE: $_currentPage",
  //                 style: const TextStyle(color: Colors.white, fontSize: 20),
  //               ),
  //             ),
  //           ),
  //           Pager(
  //             currentPage: _currentPage,
  //             totalPages: 5,
  //             onPageChanged: (page) {
  //               setState(() {
  //                 _currentPage = page;
  //               });
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  int _currentPage = 0;
  bool? isChecked = false;
  final ValueNotifier<Map<int, int>> _counter =
      ValueNotifier<Map<int, int>>({});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
      10,
      (index) => SizedBox(
        height: 600.h,
        child: ValueListenableBuilder(
          valueListenable: _counter,
          builder: (BuildContext context, value, Widget? child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 21.h,
                        width: 21.w,
                        decoration: BoxDecoration(
                          color: key1Color,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "${index + 1}",
                            style: defaultText16M.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 304.w,
                        child: Text(
                          '$index question',
                          style: defaultText16M,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 390.w,
                    //height: 400.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                        //itemExtent: 90,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int answer) {
                          return GestureDetector(
                            onTap: () {
                              // dùng tạm cách này đi
                              //_counter.value[index] = answer;
                              _counter.value.addAll({index: answer});
                              _counter.notifyListeners();
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10.h),
                              decoration: BoxDecoration(
                                // border: Border.all(),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.r),
                                ),
                                color: _counter.value[index] == answer
                                    ? const Color(0xff66D5FF).withOpacity(0.3)
                                    : Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Checkbox(
                                    //tristate: true,
                                    value: _counter.value[index] == answer,
                                    shape: const CircleBorder(),
                                    onChanged: (bool? value) {},
                                  ),
                                  SizedBox(
                                    width: 304.w,
                                    child:
                                        //check type of answer
                                        Text(
                                      'Answer $answer',
                                      style: defaultText16M,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: mainGradient,
          ),
        ),
        title: Text(
          'Test 8: Lorem ipsume',
          style: defaultText18B.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thời gian còn lại',
                  style: defaultText16B,
                ),
                Text(
                  '12:34',
                  style: defaultText16B.copyWith(
                    color: sub1Color,
                    fontSize: 20.sp,
                  ),
                )
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 35.h,
                width: 74.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10.r,
                    ),
                  ),
                  color: sub1Color,
                ),
                child: Center(
                  child: Text(
                    'Nộp bài',
                    style: defaultText16B.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        // Container(
        //   width: 350.w,
        //   height: 110.h,
        //   padding: EdgeInsets.symmetric(horizontal: 10.w),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(8.r)),
        //     boxShadow: [
        //       BoxShadow(
        //         color: kPrimaryColor.withOpacity(0.2),
        //         spreadRadius: 5,
        //         blurRadius: 7,
        //         offset: const Offset(4, 7), // changes position of shadow
        //       ),
        //     ],
        //     color: Colors.white,
        //   ),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         'Đề bài:',
        //         style: defaultBoldText,
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 20.h,
        ),
        pages[_currentPage],
      ]),
      // card for elevation
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        child: NumberPaginator(
          // by default, the paginator shows numbers as center content
          numberPages: 10,
          onPageChange: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}

class Answer extends StatefulWidget {
  const Answer({super.key, required this.title});
  final String title;
  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Checkbox(
          //tristate: true,
          value: isChecked,
          shape: const CircleBorder(),
          onChanged: (bool? value) {
            setState(() {
              isChecked = value;
            });
          },
        ),
        SizedBox(
          width: 304.w,
          child: Text(
            widget.title,
            style: defaultText16B,
          ),
        ),
      ],
    );
  }
}
