import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/teacher/teacher_model/teacher_class_model.dart';
import 'package:pmp_english/teacher_modules/teacher_class/document/detail_exam_screen.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key, required this.model});
  final DetailedExamModel model;
  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int activeTabIndex = 0;
  int _type = 1;
  @override
  void initState() {
    super.initState();
    _type = widget.model.documentModel.isNotEmpty ? 1 : 2;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: _type == 1
                  ? widget.model.documentModel.length
                  : widget.model.examModel.length,
              itemBuilder: (BuildContext context, int index) {
                return _type == 1
                    ? _StudentItem(
                        documentModel: widget.model.documentModel[index],
                        type: _type,
                      )
                    : _StudentItem(
                        examModel: widget.model.examModel[index],
                        type: _type,
                      );
              })
        ],
      ),
    );
  }
}

class _StudentItem extends StatelessWidget {
  const _StudentItem({required this.type, this.examModel, this.documentModel});
  final int type;
  final StudentExamModel? examModel;
  final DocumentModel? documentModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailExamScreen(),
        //   ),
        // );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
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
              type == 1
                  ? documentModel?.fullName ?? ''
                  : examModel?.fullName ?? '',
              style: defaultText16M,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
