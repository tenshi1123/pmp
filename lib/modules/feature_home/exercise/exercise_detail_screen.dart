import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pmp_english/modules/feature_home/exercise/test_detail_screen.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Bài tập',
                    style: defaultText14B,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),

                // RichText(
                //   text: TextSpan(
                //       text: '<  Chi tiết buổi học ',
                //       style: defaultBoldText.copyWith(
                //         fontSize: 14.sp,
                //         color: keyBlack.withOpacity(0.5),
                //       ),
                //       recognizer: TapGestureRecognizer()
                //         ..onTap = () => Navigator.of(context).pop(),
                //       children: [
                //         TextSpan(
                //           text: ' <  Kiểm tra',
                //           style: defaultBoldText.copyWith(fontSize: 14.sp),
                //         )
                //       ]),
                // ),

                //  SvgPicture.asset('assets/icons/three_dots_icon.svg'),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            const _InfoTest(
              isComplete: false,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Báo cáo kết quả',
              style: defaultText18B.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
            //_resultTest(),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Hiện chưa có bài làm',
              style: defaultText14M.copyWith(
                color: key1Color.withOpacity(0.5),
              ),
            ),

            // Container(
            //   width: 350.w,
            //   height: 51.h,
            //   decoration: BoxDecoration(
            //     color: const Color(0xffDEE4ED),
            //     borderRadius: BorderRadius.all(Radius.circular(10.r)),
            //   ),
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: 20.w,
            //       ),
            //       Text(
            //         'Xem chi tiết bài làm',
            //         style: defaultText16B,
            //       ),
            //       const Spacer(),
            //       Icon(
            //         Icons.keyboard_arrow_right,
            //         color: key1Color,
            //         size: 30.dm,
            //         semanticLabel: 'Text to announce in accessibility modes',
            //       ),
            //       SizedBox(
            //         width: 20.w,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class _InfoTest extends StatelessWidget {
  const _InfoTest({
    super.key,
    required this.isComplete,
  });
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
        boxShadow: [
          BoxShadow(
            color: key1Color.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(4, 5), // changes position of shadow
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () async {
          //comment qua dot review apple
        },
        child: Stack(
          children: [
            Positioned(
              right: 12.w,
              top: 12.h,
              child: Container(
                height: 63.h,
                width: 63.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(4, 5),
                      )
                    ]),
                child: Center(
                  child: Text(
                    '--.--',
                    style: defaultText18B.copyWith(color: main1Color),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10.h,
              left: 10.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: 90.w,
                  //       height: 23.h,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  //         color: kPrimaryColor,
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           'Trắc nghiệm',
                  //           style: defaultBoldText.copyWith(
                  //             color: Colors.white,
                  //             fontSize: 12.w,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 6.w,
                  //     ),
                  //     Container(
                  //       width: 81.w,
                  //       height: 21.h,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  //         color: kPrimaryColor,
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           '15 phút',
                  //           style: defaultBoldText.copyWith(
                  //             color: Colors.white,
                  //             fontSize: 12.w,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 253.w,
                    child: Text(
                      'Test 8: Reading',
                      style: defaultText18B,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Thời lượng: 15 phút',
                    style: defaultText12Re,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Ngày giao: 26 tháng , 2024',
                    style: defaultText12Re,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Hạn hoàn thành: 27 tháng 5, 2024',
                    style: defaultText12B,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  // SizedBox(
                  //   width: 320.w,
                  //   child: Text(
                  //     'dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                  //     style: defaultText14,
                  //     overflow: TextOverflow.ellipsis,
                  //     maxLines: 3,
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    height: 1.h,
                    width: 300.w,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  isComplete
                      ? Container(
                          width: 326.w,
                          height: 51.h,
                          decoration: BoxDecoration(
                            color: const Color(0xffDEE4ED),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                          ),
                          child: Center(
                              child: Text('Đã hoàn thành',
                                  style: defaultText20B.copyWith(
                                      color: Colors.white))),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const TestDetailScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 326.w,
                            height: 51.h,
                            decoration: BoxDecoration(
                              gradient: mainGradient,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                            ),
                            child: Center(
                              child: Text(
                                'Làm bài',
                                style: defaultText20B.copyWith(
                                    color: Colors.white),
                              ),
                            ),
                          ),
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

Widget _resultTest() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircularPercentIndicator(
          radius: 80.r,
          lineWidth: 13.0,
          animation: true,
          percent: 35 / 40,
          center: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.h,
              ),
              // Text(
              //   "35      ",
              //   style: defaultBoldText.copyWith(fontSize: 30.sp),
              // ),
              // Divider(
              //   thickness: 2,
              //   color: keyBlack,
              //   indent: 30.w,
              //   endIndent: 30.w,
              // ),
              // Text(
              //   "      40",
              //   style: defaultBoldText.copyWith(fontSize: 20.sp),
              // ),
              Text('85%', style: defaultText20B),
            ],
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: key1Color,
          backgroundColor: key1Color.withOpacity(0.3)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _resultText(tittle1: 'Thời gian hoàn thành', title2: '00:13:41'),
          _resultText(tittle1: 'Trả lời đúng', title2: '35 câu'),
          _resultText(tittle1: 'Trả lời sai', title2: '5 câu'),
          _resultText(tittle1: 'Chưa làm', title2: '0 câu'),
        ],
      )
    ],
  );
}

Widget _resultText({required String tittle1, required String title2}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        tittle1,
        style: defaultText14M,
      ),
      Text(
        title2,
        style: defaultText14M,
      ),
      SizedBox(
        height: 8.h,
      )
    ],
  );
}
