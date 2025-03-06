import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pmp_english/modules/chat/screen/chat_screen.dart';
import 'package:pmp_english/modules/lesson/detail_lesson_screen.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class Lesson extends StatelessWidget {
  const Lesson(
      {super.key,
      required this.title1,
      required this.title2,
      required this.title3});
  final String title1;
  final String title2;
  final String title3;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DetailLessonScreen(),
          ),
        );
      },
      child: Container(
        height: 100.h,
        width: 350.w,
        margin: EdgeInsets.only(bottom: 10.h, right: 10.w, left: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
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
      ),
    );
  }
}

class ExamDay extends StatelessWidget {
  const ExamDay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ExcerciseItem extends StatelessWidget {
  const ExcerciseItem({super.key, required this.isComplete});
  final bool isComplete;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.h,
      width: 350.w,
      margin: EdgeInsets.only(bottom: 10.h, right: 10.w, left: 10.w, top: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isComplete ? mainGradient2 : mainGradient4,
            ),
            child: SvgPicture.asset(
              'assets/icons/excercise.svg',
              height: 18.h,
              width: 18.w,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          SizedBox(
            height: 70.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  isComplete ? 'Bai tap tuan 2' : 'Bai tap tuan 1',
                  style: defaultText16B,
                ),
                Text(
                  'Hạn nộp: 27 tháng 5, 2024',
                  style: defaultText14Re,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget homeTab(
    {required String title,
    bool isSeprator = true,
    bool hasNumber = true,
    int count = 0}) {
  return Tab(
    child: Container(
      //width: 70.w,
      height: 50.h,
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
            width: 3.w,
          ),
          SizedBox(
            width: 77.w,
            child: Center(
              child: Text(
                title,
              ),
            ),
          ),
          hasNumber
              ? Container(
                  decoration: BoxDecoration(
                    color: keyBlack,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  height: 20.h,
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: Center(
                    child: Text(
                      '10',
                      style: defaultText12B.copyWith(color: Colors.white),
                    ),
                  ),
                )
              : SizedBox(
                  width: 10.w,
                ),
        ],
      ),
    ),
  );
}

class ConversationItem extends StatelessWidget {
  const ConversationItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatScreen(),
          ),
        );
      },
      child: Container(
        height: 73.h,
        width: 350.w,
        decoration: BoxDecoration(
            color: Colors.white,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 21.r,
              backgroundColor: Colors.blue.shade800,
              child: const Text('AH'),
            ),
            SizedBox(
              width: 220.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PMP English - hỗ trợ $index',
                    style: defaultText14B,
                  ),
                  Text(
                    'Đây là tin nhắn cuối cùng $index',
                    style: defaultText12M,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '09:03',
                  style: defaultText12Re,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 9.h,
                  width: 9.w,
                  decoration: BoxDecoration(
                    color: sub2Color,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget chartItem({
  required int width,
  required int percents,
  required String title,
}) {
  return Container(
    height: 34.h,
    width: width.w,
    margin: EdgeInsets.only(bottom: 10.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.r),
      color: state2,
    ),
    child: Stack(
      children: [
        Positioned(
            left: 0,
            child: Container(
              height: 34.h,
              width: width.w * percents / 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                gradient: mainGradient,
              ),
            )),
        Positioned(
          left: 10.w,
          right: 10.w,
          child: SizedBox(
            height: 34.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: defaultText14B.copyWith(color: Colors.white),
                ),
                Text(
                  '$percents%',
                  style: defaultText14B,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class InfoLichhen extends StatefulWidget {
  const InfoLichhen({super.key, required this.type});
  final String type;

  @override
  _InfoLichhenState createState() => _InfoLichhenState();
}

class _InfoLichhenState extends State<InfoLichhen> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            // boxShadow: const [
            //   BoxShadow(
            //     color: Colors.black,
            //     offset: Offset(6, 6),
            //     spreadRadius: 2,
            //     blurStyle: BlurStyle.solid,
            //   ),
            // ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff00AEEF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thông tin lịch hẹn',
                        style: defaultText16B.copyWith(color: Colors.white),
                      ),
                      const CloseButton(
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              const _InfoItem(
                title1: 'Cơ sở: ',
                title2: 'Cơ sở 1',
              ),
              SizedBox(
                height: 8.h,
              ),
              const _InfoItem(
                title1: 'Học viên: ',
                title2: 'Nguyễn Lâm Anh',
              ),
              SizedBox(
                height: 8.h,
              ),
              const _InfoItem(
                title1: 'CM: ',
                title2: 'Sale Phan Anh A',
              ),
              SizedBox(
                height: 8.h,
              ),
              const _InfoItem(
                title1: 'Thời gian: ',
                title2: '17:30 28/02/2024',
              ),
              SizedBox(
                height: 8.h,
              ),
              const _InfoItem(
                title1: 'Ghi chú: ',
                title2: '',
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.w,
                  top: 10.h,
                  right: 12.w,
                ),
                child: Container(
                    width: 310.w,
                    height: 120.h,
                    padding: EdgeInsets.only(
                      left: 16.w,
                      top: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      color: const Color(0xffF5F7FA),
                    ), //
                    child: Text(
                      'Khách hẹn đến trung tâm',
                      style: defaultText14M.copyWith(
                        color: const Color(0xff09204E),
                      ),
                    )),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class DocumentItem extends StatelessWidget {
  const DocumentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.h,
      width: 350.w,
      margin: EdgeInsets.only(bottom: 10.h, right: 10.w, left: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: key1Color.withOpacity(0.3),
            ),
            child: SvgPicture.asset(
              'assets/icons/excercise.svg',
              height: 18.h,
              width: 18.w,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          SizedBox(
            height: 70.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Tai lieu.PDF',
                  style: defaultText16B,
                ),
                Text(
                  'Đã xem',
                  style: defaultText14Re,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.title1, required this.title2});
  final String title1;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16.w,
        ),
        SizedBox(
          width: 90.w,
          child: Text(
            title1,
            style: defaultText16B.copyWith(
                color: const Color(0xff09204E).withValues(alpha: 0.48)),
          ),
        ),
        SizedBox(
          width: 180.w,
          child: Text(
            title2,
            style: defaultText16B.copyWith(color: const Color(0xff09204E)),
          ),
        ),
      ],
    );
  }
}
