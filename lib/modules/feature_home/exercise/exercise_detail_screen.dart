import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          ],
        ),
      ),
    );
  }
}

class _InfoTest extends StatelessWidget {
  const _InfoTest({
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
