import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/l10n/l10n.dart';
import 'package:pmp_english/student_models/my_course_model.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/custom_widget.dart';

class ExcerciseScreen extends StatelessWidget {
  const ExcerciseScreen({super.key, required this.baiTapModel});
  final MycourseBaiTapModel baiTapModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 630.h,
            width: 390.w,
            child: _ExcerciseTabBar(
              baiTapModel: baiTapModel,
            )),
      ],
    );
  }
}

class _ExcerciseTabBar extends StatefulWidget {
  const _ExcerciseTabBar({required this.baiTapModel});
  final MycourseBaiTapModel baiTapModel;
  @override
  State<_ExcerciseTabBar> createState() => _ExcerciseTabBarState();
}

class _ExcerciseTabBarState extends State<_ExcerciseTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late List<BaiTapValueModel> baitapChuaLam;
  late List<BaiTapValueModel> baitapDaLam;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    baitapChuaLam =
        widget.baiTapModel.value.where((e) => e.status == 0).toList();
    baitapDaLam = widget.baiTapModel.value.where((e) => e.status == 1).toList();
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TabBar.secondary(
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.only(right: 10.w),
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
            labelStyle: defaultText14M,
            labelColor: keyBlack,
            controller: _tabController,
            tabs: <Widget>[
              homeTab(
                title: L10n.of(context).all,
                isSeprator: false,
                number: widget.baiTapModel.value.length,
              ),
              homeTab(
                title: L10n.of(context).notStarted,
                number: baitapChuaLam.length,
              ),
              homeTab(
                title: L10n.of(context).complete,
                number: baitapDaLam.length,
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: widget.baiTapModel.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: ExcerciseItem(
                        isComplete: true,
                        model: widget.baiTapModel.value[index],
                        courseID: widget.baiTapModel.scheduleId,
                      ),
                    );
                  }),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: baitapChuaLam.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        child: ExcerciseItem(
                      isComplete: false,
                      model: baitapChuaLam[index],
                      courseID: widget.baiTapModel.scheduleId,
                    ));
                  }),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: baitapDaLam.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        child: ExcerciseItem(
                      isComplete: true,
                      model: baitapDaLam[index],
                      courseID: widget.baiTapModel.scheduleId,
                    ));
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
