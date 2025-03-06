import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/styles.dart';
import 'student_list.dart';

class LessonDetail extends StatefulWidget {
  const LessonDetail({super.key});

  @override
  State<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends State<LessonDetail> {
  final ValueNotifier<int> _pickValue = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff00AEEF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        title: Text(
          '    Chi tiết buổi học',
          style: defaultText18B.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: ValueListenableBuilder<int>(
        builder: (BuildContext context, int value, Widget? child) {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50.h,
                color: const Color(0xff00AEEF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _pickValue.value = 0;
                      },
                      child: Container(
                        width: 127.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                          color: value == 0
                              ? Colors.white
                              : const Color(0xffF4F6FA),
                        ),
                        child: Center(
                          child: Text(
                            'Điểm danh',
                            style: defaultText16B.copyWith(
                              color: value == 0
                                  ? const Color(0xff09204E)
                                  : const Color(0xff09204E)
                                      .withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _pickValue.value = 1;
                      },
                      child: Container(
                        width: 127.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                          color: value == 1
                              ? Colors.white
                              : const Color(0xffF4F6FA),
                        ),
                        child: Center(
                          child: Text(
                            'Bài tập',
                            style: defaultText16B.copyWith(
                              color: value == 1
                                  ? const Color(0xff09204E)
                                  : const Color(0xff09204E)
                                      .withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _pickValue.value = 2;
                      },
                      child: Container(
                        width: 127.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                          color: value == 2
                              ? Colors.white
                              : const Color(0xffF4F6FA),
                        ),
                        child: Center(
                          child: Text(
                            'Đề thi',
                            style: defaultText16B.copyWith(
                              color: value == 2
                                  ? const Color(0xff09204E)
                                  : const Color(0xff09204E)
                                      .withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              value == 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return _RollCallItem(
                          index: index,
                        );
                      })
                  : value == 1
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return _ExcerciseItem(
                                'Bài tập tự luận ${index + 1}');
                          })
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return _ExcerciseItem('Đề thi số ${index + 1}');
                          }),
            ],
          );
        },
        valueListenable: _pickValue,
      ),
    );
  }
}

class _RollCallItem extends StatelessWidget {
  const _RollCallItem({required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
          color: const Color(0xffF5F7FA)),
      child: Row(
        children: [
          Image.asset(
            'assets/images/little_avatar.png',
            width: 28.w,
            height: 28.h,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            'Nguyễn Lâm Anh',
            style: defaultText16M,
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6.r),
              ),
              color: index == 0
                  ? const Color(0xffFF6B6B)
                  : index == 1
                      ? const Color(0xffFFA94D)
                      : index == 2
                          ? const Color(0xffF9D30A)
                          : const Color(0xff51CF66),
            ),
            child: Text(
              index == 0
                  ? 'Vắng mặt'
                  : index == 1
                      ? 'Xin nghỉ'
                      : index == 2
                          ? 'Đi muộn'
                          : 'Đúng giờ',
              style: defaultText12M.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExcerciseItem extends StatelessWidget {
  const _ExcerciseItem(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const StudentList(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
            border: Border.all(color: const Color(0xff00AEEF)),
            color: const Color(0xffF5F7FA)),
        child: Row(
          children: [
            Image.asset(
              'assets/images/exercise.png',
              width: 40.w,
              height: 40.h,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              title,
              style: defaultText16M.copyWith(color: Colors.black),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
