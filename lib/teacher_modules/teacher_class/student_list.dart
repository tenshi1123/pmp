import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/styles.dart';

import 'teacher_detail_lesson.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});
  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int activeTabIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(() {
      setState(() {
        activeTabIndex = _tabController.index;
      });
    });
  }

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
          '    Danh sách học viên',
          style: defaultText18B.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}

class ListFbDaily extends StatelessWidget {
  const ListFbDaily({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LessonDetail()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Dự kiến 26/12/2024',
            style: defaultText14M.copyWith(
                color: const Color(0xff09204E).withValues(
              alpha: 0.48,
            )),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 263.w,
                child: Text(
                  'Buổi $index : làm quen với từ vựng giao tiếp căn bản ',
                  style:
                      defaultText16B.copyWith(color: const Color(0xff09204E)),
                ),
              ),
              const Spacer(),
              Image.asset(
                'assets/images/next.png',
                height: 20.h,
                width: 20.w,
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class ListFbDinhKy extends StatelessWidget {
  const ListFbDinhKy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 12.h,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Lớp',
              style: defaultText20B.copyWith(
                color: const Color(0xff273D8C),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
