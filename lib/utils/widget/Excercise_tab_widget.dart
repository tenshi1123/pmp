import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/modules/feature_home/exercise/exercise_detail_screen.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/custom_widget.dart';

class ExcerciseTabBar extends StatefulWidget {
  const ExcerciseTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<ExcerciseTabBar> createState() => _ExcerciseTabBarState();
}

class _ExcerciseTabBarState extends State<ExcerciseTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        TabBar.secondary(
          tabAlignment: TabAlignment.start,
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
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
            homeTab(title: 'Toàn bộ', isSeprator: false),
            homeTab(title: 'Chưa làm'),
            homeTab(title: 'Hoàn thành'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TestScreen(),
                          ));
                        },
                        child: const ExcerciseItem(
                          isComplete: true,
                        ));
                  }),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TestScreen(),
                          ));
                        },
                        child: const ExcerciseItem(
                          isComplete: false,
                        ));
                  }),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Không có bài tập nào',
                    style: defaultText14M,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
