import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/custom_widget.dart';

class DetailLessonScreen extends StatelessWidget {
  const DetailLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
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
                  SizedBox(
                    width: 6.w,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '  Chi tiết buổi học ',
                      style: defaultText14B,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).pop(),
                    ),
                  ),
                  SizedBox(
                    width: 200.w,
                  ),
                  //SvgPicture.asset('assets/icons/three_dots_icon.svg'),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 300.h,
                width: 350.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Buổi 25: Đường thẳng Ơ Le',
                      style: defaultText18B,
                    ),
                    Divider(
                      color: Colors.black,
                      endIndent: 200.w,
                      height: 20,
                      thickness: 2,
                    ),
                    Text(
                      'Nội dung',
                      style: defaultText14B,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        'Bất đẳng thức Cosi là một trong những kiến thức toán học phổ biến, được sử dụng để giải nhiều dạng toán về phương trình và bất phương trình khác nhau cũng như tìm giá trị lớn nhất và giá trị nhỏ nhất của biểu thức. Trong bài viết này,',
                        style: defaultText14Re,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 120.h,
                      width: 326.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.r),
                          ),
                          color: baseColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Phòng học',
                                  style: defaultText14Re,
                                ),
                              ),
                              Text(
                                'P101',
                                style: defaultText14B,
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Giảng viên',
                                  style: defaultText14Re,
                                ),
                              ),
                              Text(
                                'Giáo viên 1',
                                style: defaultText14B,
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Ca học',
                                  style: defaultText14Re,
                                ),
                              ),
                              Text(
                                '08:00 - 11:00',
                                style: defaultText14B,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              SizedBox(
                height: 500.h,
                width: 390.w,
                child: const DetailLessonTabbar('Flights'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailLessonTabbar extends StatefulWidget {
  const DetailLessonTabbar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<DetailLessonTabbar> createState() => _DetailLessonTabbarState();
}

class _DetailLessonTabbarState extends State<DetailLessonTabbar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
              horizontal: 6.w,
            ), //give some padding to reduce the size of indicator
          ),
          unselectedLabelColor: keyBlack.withOpacity(0.3),
          labelColor: keyBlack,
          labelStyle: defaultText12M,
          controller: _tabController,
          tabs: <Widget>[
            homeTab(
              title: 'Video',
              isSeprator: false,
              hasNumber: false,
            ),
            homeTab(
              title: 'Bài tập',
              hasNumber: false,
            ),
            homeTab(
              title: 'Tài liệu',
              hasNumber: false,
            ),
            homeTab(
              title: 'Đánh giá',
              hasNumber: false,
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              const _VideoWidget(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const ExcerciseItem(
                      isComplete: true,
                    );
                  }),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return const DocumentItem();
                  }),
              Column(children: [
                SizedBox(
                  height: 10.h,
                ),
                const _FeedbackItem(),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

//hai người đàn bà và một con vịt thành cái chợ
class _VideoWidget extends StatelessWidget {
  const _VideoWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Image.asset('assets/images/demoVideo.png'),
        Row(
          children: [
            const Icon(
              Icons.hourglass_top,
              color: Colors.pink,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            Text(
              'Video sẽ mở khóa sau: 07h30p. ',
              style: defaultText14M.copyWith(
                color: main1Color,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _FeedbackItem extends StatelessWidget {
  const _FeedbackItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 166.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
            width: 310.w,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffDBC6C6),
                  radius: 21.r,
                  child: const Text('NP'),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Nguyễn Phú',
                      style: defaultText14B,
                    ),
                    Text(
                      'Giảng viên',
                      style: defaultText12Re,
                    )
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.star,
                  color: const Color(0xffFFCF68),
                  size: 24.dg,
                ),
                Icon(
                  Icons.star,
                  color: const Color(0xffFFCF68),
                  size: 24.dg,
                ),
                Icon(
                  Icons.star_border_outlined,
                  color: const Color(0xffFFCF68),
                  size: 24.dg,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Text(
            'Nhận xét:',
            style: defaultText12B,
          ),
          Text(
            'Đây là nhận xét của giáo viên',
            style: defaultText14Re,
          )
        ],
      ),
    );
  }
}
