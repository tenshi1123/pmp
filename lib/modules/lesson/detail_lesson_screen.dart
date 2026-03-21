import 'package:flutter/gestures.dart';
import 'package:pmp_english/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pmp_english/l10n/l10n.dart';
import 'package:pmp_english/modules/lesson/video_screen.dart';
import 'package:pmp_english/student_models/home_model.dart';
import 'package:pmp_english/student_models/my_course_model.dart';
import 'package:pmp_english/student_repo/mycourse_repo.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/custom_widget.dart';
import 'package:url_launcher/url_launcher.dart';

String parseVideoUrl(String content) {
  if (content.contains('<iframe')) {
    final regex = RegExp(r'src="([^"]+)"');
    final match = regex.firstMatch(content);
    return match?.group(1) ?? '';
  }
  return content;
}

bool isYoutubeUrl(String url) {
  return url.contains('youtube.com') || url.contains('youtu.be');
}

String getYoutubeId(String url) {
  Uri uri = Uri.parse(url);

  if (uri.queryParameters.containsKey('v')) {
    return uri.queryParameters['v']!;
  }

  if (uri.host.contains('youtu.be')) {
    return uri.pathSegments.first;
  }

  if (uri.pathSegments.contains('embed')) {
    return uri.pathSegments.last;
  }

  return '';
}

String getThumbnail(String url) {
  final id = getYoutubeId(url);
  return 'https://img.youtube.com/vi/$id/0.jpg';
}

class DetailLessonScreen extends StatelessWidget {
  const DetailLessonScreen({super.key, required this.videoLessonModel});
  final VideoLessonModel videoLessonModel;

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
                      text: '  ${L10n.of(context).lessonDetails} ',
                      style: defaultText16M,
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
                //height: 300.h,
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
                      "${videoLessonModel.name} ${videoLessonModel.teachingContent}",
                      style: defaultText18B,
                    ),
                    Divider(
                      color: Colors.black,
                      endIndent: 200.w,
                      height: 20,
                      thickness: 2,
                    ),
                    Text(
                      L10n.of(context).content,
                      style: defaultText14B,
                    ),
                    // AutoLinkText(
                    //   text: videoLessonModel.noiDungBuoiHoc ?? "",
                    //   isMine: false,
                    // ),
                    Html(
                      data: videoLessonModel.noiDungBuoiHoc ?? "",
                      // onAnchorTap: (url, attributes, element) {
                      //   if (url == null) return;
                      //   _launchUrl(url);
                      // },
                      onLinkTap: (url, attributes, element) async {
                        if (!await launchUrl(Uri.parse(url ?? ''))) {
                          throw Exception('Could not launch');
                        }
                      },
                      style: {
                        "table": Style(
                          backgroundColor:
                              const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                        ),
                        "th": Style(
                          padding: HtmlPaddings.all(6),
                          backgroundColor: Colors.grey,
                        ),
                        "td": Style(
                          padding: HtmlPaddings.all(6),
                          border: const Border(
                              bottom: BorderSide(color: Colors.grey)),
                        ),
                        'h5': Style(
                            maxLines: 2, textOverflow: TextOverflow.ellipsis),
                        'flutter': Style(
                          display: Display.block,
                          fontSize: FontSize(5, Unit.em),
                        ),
                        ".second-table": Style(
                          backgroundColor: Colors.transparent,
                        ),
                        ".second-table tr td:first-child": Style(
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.end,
                        ),
                        "p": Style(
                          color: Colors.black,
                          fontSize: FontSize(16.sp),
                          fontWeight: FontWeight.w400,
                          lineHeight: const LineHeight(1.5),
                        ),
                      },
                    ),
                    Container(
                      //height: 120.h,
                      width: 326.w,
                      margin: EdgeInsets.symmetric(vertical: 10.h),
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
                                  L10n.of(context).classroomLabel,
                                  style: defaultText14Re,
                                ),
                              ),
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  videoLessonModel.phongHoc,
                                  style: defaultText14B,
                                ),
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
                                  L10n.of(context).lecturer,
                                  style: defaultText14Re,
                                ),
                              ),
                              Text(
                                videoLessonModel.teacherFullName,
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
                                  L10n.of(context).shift,
                                  style: defaultText14Re,
                                ),
                              ),
                              Text(
                                '${DateFormat("hh:mm a").format(videoLessonModel.timeStart)} - ${DateFormat("hh:mm a").format(videoLessonModel.timeEnd)}',
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
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 500.h,
                width: 390.w,
                child: DetailLessonTabbar(
                  videoLessonModel: videoLessonModel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailLessonTabbar extends StatefulWidget {
  const DetailLessonTabbar({super.key, required this.videoLessonModel});
  final VideoLessonModel videoLessonModel;

  @override
  State<DetailLessonTabbar> createState() => _DetailLessonTabbarState();
}

class _DetailLessonTabbarState extends State<DetailLessonTabbar>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  List<DeValueModel> listdoc = [];
  EvaluationModel? evaModel;
  @override
  void initState() {
    super.initState();
    _fetchData();
    // Khởi tạo TabController với số lượng tab
    // và vsync là this (đối tượng hiện tại của State)
    _tabController = TabController(length: 4, vsync: this);
  }

  Future<void> _fetchData() async {
    listdoc = await MycourseRepo().getDocument(id: widget.videoLessonModel.id);
    evaModel =
        await MycourseRepo().getEvaluation(id: widget.videoLessonModel.id);
    setState(() {
      // Cập nhật trạng thái để hiển thị dữ liệu mới
    });
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
          labelPadding: const EdgeInsets.symmetric(horizontal: 0),
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
              title: L10n.of(context).videoLabel,
              isSeprator: false,
              hasNumber: false,
            ),
            homeTab(
              title: L10n.of(context).assignments,
              hasNumber: false,
            ),
            homeTab(
              title: L10n.of(context).materials,
              hasNumber: false,
            ),
            homeTab(
              title: L10n.of(context).feedBack,
              hasNumber: false,
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              _VideoWidget(
                videoLessonModel: widget.videoLessonModel,
              ),
              ExerciseItem(
                id: widget.videoLessonModel.id,
                courseID: widget.videoLessonModel.customerCourseScheduleId,
              ),
              _DocumentItem(
                listdoc: listdoc,
              ),
              // QrImageView(
              //   data: 'https://testflight.apple.com/join/G82m3UGP',
              //   version: QrVersions.auto,
              //   size: 220,
              // ),

              SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  _FeedbackItem(evaModel),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//hai người đàn bà và một con vịt thành cái chợ
class _VideoWidget extends StatelessWidget {
  const _VideoWidget({required this.videoLessonModel});
  final VideoLessonModel videoLessonModel;
  @override
  Widget build(BuildContext context) {
    final rawContent = videoLessonModel.content;
    final videoUrl = parseVideoUrl(rawContent); // ✅ FIX
    final isYoutube = isYoutubeUrl(videoUrl); // ✅ FIX

    return rawContent == ''
        ? Center(
            child: Image.asset(
              'assets/images/empty2.png',
              scale: 2,
            ),
          )
        : Column(
            children: [
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(
                        videoUrl: videoLessonModel.content, // ✅ FIX
                      ),
                    ),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    isYoutube
                        ? Image.network(
                            getThumbnail(videoUrl), // ✅ FIX
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/demoVideo.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200,
                              );
                            },
                          )
                        : Image.asset(
                            'assets/images/demoVideo.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),

                    /// 🔥 luôn show play button
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

class _FeedbackItem extends StatelessWidget {
  const _FeedbackItem(this.evaModel);
  final EvaluationModel? evaModel;
  @override
  Widget build(BuildContext context) {
    if (evaModel == null) {
      return const SizedBox();
    }

    final displayList = buildEvaluationResult(evaModel!);
    return Container(
      width: 350.w,
      //height: 166.h,
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
      child: evaModel != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                  width: 310.w,
                  child: Row(
                    children: [
                      AppImage(
                        url: evaModel!.avatar,
                        width: 40.w,
                        height: 40.h,
                        fit: BoxFit.fill,
                        errorAsset: null,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            evaModel!.fullName,
                            style: defaultText14B,
                          ),
                          Text(
                            L10n.of(context).lecturer,
                            style: defaultText12Re,
                          )
                        ],
                      ),
                      const Spacer(),
                      // Icon(
                      //   Icons.star,
                      //   color: const Color(0xffFFCF68),
                      //   size: 24.dg,
                      // ),
                      // Icon(
                      //   Icons.star,
                      //   color: const Color(0xffFFCF68),
                      //   size: 24.dg,
                      // ),
                      // Icon(
                      //   Icons.star_border_outlined,
                      //   color: const Color(0xffFFCF68),
                      //   size: 24.dg,
                      // ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                // Text(
                //   'Nhận xét:',
                //   style: defaultText12B,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: displayList.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['title'] ?? '',
                            style: defaultText14B,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '  • ${e['value']}',
                            style: defaultText14Re.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )
              ],
            )
          : Center(
              child: Image.asset(
                'assets/images/empty2.png',
                scale: 2,
              ),
            ),
    );
  }
}

class ExerciseItem extends StatefulWidget {
  const ExerciseItem({
    super.key,
    required this.id,
    required this.courseID,
  });
  final String id;
  final String courseID;
  @override
  State<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  late List<BaiTapValueModel> baiTapValueModel = [];

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future<void> _fetchData() async {
    baiTapValueModel = await MycourseRepo().getExerciseLesson(id: widget.id);
    setState(() {
      // Cập nhật trạng thái để hiển thị dữ liệu mới
    });
  }

  @override
  Widget build(BuildContext context) {
    return baiTapValueModel.isEmpty
        ? Center(
            child: Image.asset(
              'assets/images/empty2.png',
              scale: 2,
            ),
          )
        : ListView.builder(
            // shrinkWrap: true, // Removed for performance
            // physics: const ClampingScrollPhysics(),
            itemCount: baiTapValueModel.length,
            itemBuilder: (BuildContext context, int index) {
              return ExcerciseItem(
                isComplete: true,
                model: baiTapValueModel[index],
                courseID: widget.courseID,
              );
            });
  }
}

class _DocumentItem extends StatelessWidget {
  const _DocumentItem({required this.listdoc});
  final List<DeValueModel> listdoc;
  @override
  Widget build(BuildContext context) {
    return listdoc.isEmpty
        ? Center(
            child: Image.asset(
              'assets/images/empty2.png',
              scale: 2,
            ),
          )
        : ListView.builder(
            // shrinkWrap: true, // Removed for performance
            // physics: const ClampingScrollPhysics(),
            itemCount: listdoc.length,
            itemBuilder: (BuildContext context, int index) {
              return DocumentItem(
                model: listdoc[index],
              );
            });
  }
}
