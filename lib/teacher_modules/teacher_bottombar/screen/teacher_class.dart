import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:pmp_english/l10n/l10n.dart';
import 'package:pmp_english/teacher/teacher_model/teacher_class_model.dart';
import 'package:pmp_english/teacher/teacher_repo/teacher_class_repo.dart';
import 'package:pmp_english/teacher_modules/teacher_class/teacher_detail_class.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class ClassManagementScreen extends StatefulWidget {
  const ClassManagementScreen({super.key});

  @override
  State<ClassManagementScreen> createState() => _ClassManagementScreenState();
}

class _ClassManagementScreenState extends State<ClassManagementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TeacherClassModel _teacherClassModel = TeacherClassModel(zoom: [], offl: []);
  @override
  void initState() {
    super.initState();
    _fetchData();
    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> _fetchData() async {
    _teacherClassModel = await TeacherClassRepo().getTeacherClass();
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          L10n.of(context).classInCharge,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff00AEEF),
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () {},
        // ),
      ),
      body: Column(
        children: [
          // TabBar
          Container(
            color: const Color(0xff00AEEF),
            padding: EdgeInsets.only(top: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14.r),
                            topRight: Radius.circular(14.r)),
                        color: Colors.white),
                    tabs: [
                      Container(
                        width: 200.w,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14.r),
                                topRight: Radius.circular(14.r)),
                            color: Colors.white),
                        child: Tab(
                          text: L10n.of(context).centralClassroom,
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14.r),
                                  topRight: Radius.circular(14.r)),
                              color: Colors.white),
                          margin: const EdgeInsets.only(left: 10),
                          width: 200.w,
                          child: Tab(
                            text: L10n.of(context).zoomClassroom,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Nội dung tab
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Danh sách lớp học trung tâm
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _teacherClassModel.offl.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ClassCard(
                        model: _teacherClassModel.offl[index],
                      );
                    }),

                // Danh sách lớp học Zoom (tạm thời trống)
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _teacherClassModel.zoom.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ClassCard(
                        model: _teacherClassModel.zoom[index],
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget hiển thị thông tin lớp học
class ClassCard extends StatelessWidget {
  final ItemClassModel model;
  const ClassCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DetailClass detailClass =
            await TeacherClassRepo().getDetailLopHoc(model.id);
        pushWithoutNavBar(
            context,
            MaterialPageRoute(
                builder: (context) => TeacherDetail(
                      detailClass: detailClass,
                    )));
      },
      child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          margin: EdgeInsets.only(
            top: 16.h,
            right: 16.w,
            left: 16.w,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffF5F7FA),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xffCFF2FF)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/computer.png',
                width: 40.w,
                height: 40.h,
              ),
              SizedBox(width: 12.w),
              Expanded(
                // thêm cái này
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: defaultText16M.copyWith(color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      model.alias,
                      style: defaultText14Re.copyWith(
                        color: const Color(0xff09204E).withValues(alpha: 0.48),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
