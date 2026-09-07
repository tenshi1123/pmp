import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:pmp_english/l10n/l10n.dart';
import 'package:pmp_english/modules/feature_home/exercise/simple_audio_recorder.dart';
import 'package:pmp_english/student_models/excercise_model.dart';
import 'package:pmp_english/student_repo/home_repo.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/custom_audio.dart';

extension Substrings on String {
  /// Drops the last n characters.
  String dropLast(int n) {
    return n > length ? "" : substring(0, length - n);
  }
}

class TestDetailScreen extends StatefulWidget {
  const TestDetailScreen({
    super.key,
    required this.listQuestion,
    required this.title,
    required this.id,
    required this.customerCourseScheduleId,
    required this.examDetailId,
    this.isDone = false,
    required this.skill,
  });
  final List<QuestionGroupModel> listQuestion;
  final String title;
  final String id;
  final String customerCourseScheduleId;
  final String examDetailId;
  final bool isDone;
  final String skill;
  @override
  State<TestDetailScreen> createState() => _TestDetailScreenState();
}

class _TestDetailScreenState extends State<TestDetailScreen> {
  int _currentPage = 0;
  final Map<String, TextEditingController> _textControllers = {};
  var countdownDuration = const Duration(minutes: 15);
  Duration duration = const Duration();
  List<QuestionGroupModel> _listQuestion = [];
  QuestionGroupModel? _selectedQuestion;
  Timer? timer;
  Timer? timer1;
  bool countDown = true;
  bool countDown1 = true;
  bool? isChecked = false;
  ValueNotifier<Map<String, String>> _counter =
      ValueNotifier<Map<String, String>>({});
  final cauController = CauHoiHtmlController();

  late List<SubQuestionModel> allSubQuestions;
  late String selectedQuestionId = "-1";
  final PageController _pageController = PageController();
  TextEditingController _getController(String questionId) {
    if (!_textControllers.containsKey(questionId)) {
      final initialValue = _counter.value[questionId] ?? '';
      final controller = TextEditingController(text: initialValue);

      controller.addListener(() {
        _counter.value = {
          ..._counter.value,
          questionId: controller.text,
        };
      });

      _textControllers[questionId] = controller;
    }

    return _textControllers[questionId]!;
  }

  @override
  void dispose() {
    cauController.dispose();
    timer1?.cancel();
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _listQuestion = widget.listQuestion;

    if (_listQuestion.isEmpty) {
      selectedQuestionId = "-1";
      _selectedQuestion = null;
      return;
    }

    selectedQuestionId = _listQuestion.first.id;
    _selectedQuestion = _listQuestion.first;

    allSubQuestions =
        widget.listQuestion.expand((q) => q.value.values).toList();
    int hours1;
    int mints1;
    int secs1;
    hours1 = int.parse("00");
    mints1 = int.parse("15");
    secs1 = int.parse("00");
    countdownDuration =
        Duration(hours: hours1, minutes: mints1, seconds: secs1);
    startTimer();
    reset();
    _counter = ValueNotifier({
      for (var q in _listQuestion) q.id: "",
    });
  }

  Future<void> fetchPostsByCategory(String id) async {
    final index = _listQuestion.indexWhere((q) => q.id == id);

    if (index == -1) return;

    if (!mounted) return;

    setState(() {
      selectedQuestionId = id;
      _selectedQuestion = _listQuestion[index];
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void reset() {
    if (!mounted) return;
    setState(() {
      duration = countDown ? countdownDuration : const Duration();
    });
  }

  void stopTimer() {
    setState(
      () {
        timer1?.cancel();
      },
    );
  }

  void addTime() {
    const addSeconds = 1;
    final seconds = duration.inSeconds - addSeconds;
    if (seconds < 0) {
      timer1?.cancel();
    } else {
      if (!mounted) return;
      setState(() {
        duration = Duration(seconds: seconds);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final values = _selectedQuestion?.value.values.toList() ?? [];
    final String? firstType = values.isNotEmpty ? values.first.type : null;
    if (_listQuestion.isEmpty || _selectedQuestion == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: mainGradient,
          ),
        ),
        title: Text(
          widget.title,
          style: defaultText18B.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          //SizedBox(height: 10.h),
          // if (widget.skill == '4')
          //   Padding(
          //     padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
          //     child: Text(
          //       'Học viên vui lòng thao tác bài tập dạng nghe trên web',
          //       style: defaultText16B,
          //     ),
          //   ),
          if (!widget.isDone)
            Row(
              children: [
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Thời gian còn lại', style: defaultText16B),
                    buildTime1(),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: const Text('Bạn có chắc chắn muốn nộp bài'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              child: Text('Đồng ý', style: defaultText20B),
                              onPressed: () async {
                                final answerList = cauController
                                    .getAnswers()
                                    .entries
                                    .map((entry) {
                                  return {
                                    'id': entry.key,
                                    'answer': entry.value,
                                  };
                                }).toList();
                                final counterList =
                                    _counter.value.entries.map((entry) {
                                  return {
                                    'id': entry.key,
                                    'answer': entry.value,
                                  };
                                }).toList();
                                final result = [...counterList, ...answerList];
                                result.sort((a, b) => int.parse(a['id']!)
                                    .compareTo(int.parse(b['id']!)));
                                final cleaned =
                                    removeDuplicatesKeepLast(result);
                                stopTimer();
                                String message =
                                    await HomeRepo().submitTracNghiem(
                                  id: widget.id,
                                  examDetailId: widget.examDetailId,
                                  customerCourseScheduleId:
                                      widget.customerCourseScheduleId,
                                  startTime: DateTime.now().toIso8601String(),
                                  data: cleaned,
                                );
                                Navigator.pop(context);

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      title: Row(
                                        children: [
                                          const Icon(Icons.check_circle,
                                              color: Colors.green, size: 28),
                                          const SizedBox(width: 10),
                                          Text(message, style: defaultText16B),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text("Đóng",
                                              style: TextStyle(
                                                  color: Colors.blue)),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              child: Text(L10n.of(context).cancel,
                                  style: defaultText20B),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      color: sub1Color,
                    ),
                    child: Center(
                      child: Text(
                        L10n.of(context).submit,
                        style: defaultText16B.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
          //SizedBox(height: 10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: _listQuestion.asMap().entries.map((entry) {
                final index = entry.key;
                final question = entry.value;
                final bool isSelected = question.id == selectedQuestionId;

                return Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: ChoiceChip(
                    label: Text(
                      question.title == ''
                          ? 'Task ${index + 1}'
                          : question.title,
                    ),
                    selected: isSelected,
                    onSelected: (_) => fetchPostsByCategory(question.id),
                    selectedColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected
                          ? Colors.lightBlue
                          : const Color(0xff8A8A8A),
                      fontSize: 14.sp,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w600,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: isSelected
                            ? Colors.lightBlue
                            : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    backgroundColor: Colors.white,
                  ),
                );
              }).toList(),
            ),
          ),

          if (selectedQuestionId != "-1" && _selectedQuestion != null)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 360.h, // tối đa
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 12.w, top: 8.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HtmlContentWidget(
                        htmlContent: _selectedQuestion?.content ?? '',
                      ),
                      if (_selectedQuestion?.audioAttachment != null &&
                          _selectedQuestion!.audioAttachment!.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: SimpleAudioPlayer(
                            url: _selectedQuestion!.audioAttachment!,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

          values.isEmpty
              ? SizedBox(
                  child: Center(
                    child: Text(
                      'Không có câu hỏi nào trong bài tập này',
                      style: defaultText14M,
                    ),
                  ),
                )
              : Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.isDone
                        ? values.length
                        : firstType != '5'
                            ? values.length
                            : 1,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final groupIndex = _listQuestion
                          .indexWhere((q) => q.id == selectedQuestionId);
                      if (groupIndex == -1) {
                        return const SizedBox();
                      }
                      final values =
                          _listQuestion[groupIndex].value.values.toList();
                      if (index >= values.length) {
                        return const SizedBox();
                      }
                      return CauHoiPage(
                        index: _selectedQuestion?.value.values
                                    .toList()
                                    .first
                                    .type !=
                                '5'
                            ? index
                            : getDisplayNumber(
                                    _selectedQuestion?.value.values
                                            .toList()
                                            .first
                                            .content ??
                                        "",
                                    index) -
                                1,
                        question: values[index],
                        cauController: cauController,
                        counter: _counter,
                        answerGroup: _listQuestion[groupIndex].value,
                        textController: _getController(values[index].id),
                      );
                    },
                  ),
                ),
          (_selectedQuestion?.value.values.toList() ?? []).isEmpty
              ? const SizedBox.shrink()
              : SizedBox(
                  height: 80.h,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: _currentPage > 0
                            ? () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              }
                            : null,
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.isDone
                              ? _selectedQuestion?.value.values.toList().length
                              : firstType != '5'
                                  ? _selectedQuestion?.value.values
                                      .toList()
                                      .length
                                  : 1,
                          itemBuilder: (context, index) {
                            final bool isSelected = index == _currentPage;
                            return GestureDetector(
                              onTap: () {
                                _pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                width: 36,
                                height: 36,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? Colors.lightBlue
                                      : Colors.grey[300],
                                  border: isSelected
                                      ? Border.all(color: Colors.blue, width: 2)
                                      : null,
                                ),
                                child: Text(
                                  _selectedQuestion?.value.values
                                              .toList()
                                              .first
                                              .type !=
                                          '5'
                                      ? '${index + 1}'
                                      : '${getDisplayNumber(_selectedQuestion?.value.values.toList().first.content ?? "", index)}',
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: _currentPage <
                                (_selectedQuestion?.value.values
                                            .toList()
                                            .length ??
                                        0) -
                                    1
                            ? () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );
                              }
                            : null,
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildTime1() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(
        time: hours,
      ),
      Text(
        ':',
        style: defaultText20B.copyWith(
          color: sub1Color,
          fontSize: 20.sp,
        ),
      ),
      buildTimeCard(
        time: minutes,
      ),
      Text(
        ':',
        style: defaultText20B.copyWith(
          color: sub1Color,
          fontSize: 20.sp,
        ),
      ),
      buildTimeCard(
        time: seconds,
      ),
    ]);
  }

  Widget buildTimeCard({
    required String time,
  }) =>
      Text(
        time,
        style: defaultText20B.copyWith(
          color: sub1Color,
        ),
      );
}

class HtmlContentWidget extends StatelessWidget {
  final String htmlContent;

  const HtmlContentWidget({
    super.key,
    required this.htmlContent,
  });

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      htmlContent.trim(),
      customStylesBuilder: (element) {
        if (element.localName == 'p') {
          return {'margin': '0'};
        }
        return null;
      },
    );
  }
}

class CauHoiHtmlController {
  final Map<int, TextEditingController> _controllers = {};

  TextEditingController controllerOf(int idx) {
    return _controllers.putIfAbsent(idx, () {
      // khởi tạo mặc định với text = ''
      return TextEditingController(text: '');
    });
  }

  Map<String, String> getAnswers() {
    final Map<String, String> answers = {};
    _controllers.forEach((key, value) {
      answers["$key"] = value.text;
    });
    return answers;
  }

  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
  }
}

class CauHoiHtmlWidget extends StatelessWidget {
  final String htmlContent;
  final int id;
  final CauHoiHtmlController controller;
  const CauHoiHtmlWidget({
    super.key,
    required this.htmlContent,
    required this.controller,
    required this.id,
  });

  String _injectPlaceholders(String html) {
    final regex = RegExp(r'\{cau\}');
    int i = id + 1;
    return html.replaceAllMapped(regex, (_) {
      controller.controllerOf(i);
      final tag = '<input-placeholder data-idx="$i"></input-placeholder>';
      i++;
      return tag;
    });
  }

  @override
  Widget build(BuildContext context) {
    final transformedHtml = _injectPlaceholders(htmlContent);
    return SingleChildScrollView(
      child: HtmlWidget(
        transformedHtml,
        customWidgetBuilder: (element) {
          if (element.localName == 'input-placeholder') {
            final idx =
                int.tryParse(element.attributes['data-idx'] ?? '0') ?? 0;
            final textController = controller.controllerOf(idx);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: 200,
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: L10n.of(context).enterAnswer,
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}

class CauHoiPage extends StatefulWidget {
  final int index;
  final SubQuestionModel question;
  final CauHoiHtmlController cauController;
  final ValueNotifier<Map<String, String>> counter;
  final Map<String, SubQuestionModel> answerGroup;
  final TextEditingController textController;
  const CauHoiPage({
    super.key,
    required this.index,
    required this.question,
    required this.cauController,
    required this.counter,
    required this.answerGroup,
    required this.textController,
  });

  @override
  State<CauHoiPage> createState() => _CauHoiPageState();
}

class _CauHoiPageState extends State<CauHoiPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Đừng quên dòng này!
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 8.w,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: Text('${widget.index + 1}',
                    style: const TextStyle(color: Colors.white)),
              ),
              widget.question.title != ''
                  ? SizedBox(
                      width: 320.w,
                      child: Text(
                        widget.question.title,
                        style: defaultText16B,
                      ),
                    )
                  : const SizedBox.shrink(),
              Expanded(
                child: widget.question.type == '2'
                    ? HtmlContentWidget(
                        htmlContent: widget.question.content
                            .replaceAll(RegExp(r'<p>\s*</p>'), ''))
                    : CauHoiHtmlWidget(
                        htmlContent: widget.question.content
                            .replaceAll(RegExp(r'<p>\s*</p>'), ''),
                        controller: widget.cauController,
                        id: int.parse(widget.question.id),
                      ),
              ),
            ],
          ),
          if (widget.question.audioAttachment != null &&
              widget.question.audioAttachment != '')
            SimpleAudioPlayer(
              url: widget.question.audioAttachment!,
            ),
          if (widget.question.type == '8')
            AnswerInput(
              questionId: widget.question.id,
              counter: widget.counter,
              controller: widget.textController,
              answer: widget.question.answer,
            ),
          if (widget.question.type == '4')
            ValueListenableBuilder(
              valueListenable: widget.counter,
              builder: (_, value, __) {
                final List<String> list = widget.question.question.split(',');
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, answer) {
                    final isSelected =
                        value[widget.question.id] == list[answer];
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      // onTap: () {
                      //   widget.counter.value = {
                      //     ...widget.counter.value,
                      //     widget.question.id: answer.toString(),
                      //   };
                      // },
                      child: Container(
                        padding: EdgeInsets.only(left: 8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isSelected
                              ? Colors.lightBlueAccent.withValues(alpha: 0.3)
                              : Colors.white,
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isSelected,
                              shape: const CircleBorder(),
                              onChanged: (_) {
                                widget.counter.value = {
                                  ...widget.counter.value,
                                  widget.question.id: list[answer],
                                };
                              },
                            ),
                            Text('${list[answer]} .'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ValueListenableBuilder(
            valueListenable: widget.counter,
            builder: (_, value, __) {
              if (!value.containsKey(widget.question.id)) {
                widget.counter.value = {
                  ...value,
                  widget.question.id: '',
                };
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.question.choices.length,
                itemBuilder: (context, answer) {
                  final isSelected =
                      value[widget.question.id] == answer.toString();
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      widget.counter.value = {
                        ...widget.counter.value,
                        widget.question.id: answer.toString(),
                      };
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isSelected
                            ? Colors.lightBlueAccent.withValues(alpha: 0.3)
                            : Colors.white,
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isSelected,
                            shape: const CircleBorder(),
                            onChanged: (_) {
                              widget.counter.value = {
                                ...widget.counter.value,
                                widget.question.id: answer.toString(),
                              };
                            },
                          ),
                          Text('${answers[answer]} .'),
                          Expanded(
                            child: HtmlContentWidget(
                              htmlContent: widget.question.choices[answer].text,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          if (widget.question.type == '9')
            FlutterSoundRecorderWidget(
              questionId: widget.question.id,
              counter: widget.counter,
            ),
          if (widget.question.answerSolutions != null &&
              widget.question.answerSolutions != '' &&
              widget.question.type != '9' &&
              widget.question.answerSolutions!.isNotEmpty)
            RichText(
              text: TextSpan(
                text: L10n.of(context).answer,
                style: defaultText14M,
                children: <TextSpan>[
                  TextSpan(
                      text: widget.question.type == '2'
                          ? getAnswerLabel(widget.question.answer)
                          : widget.question.answer,
                      style: defaultText16B),
                  TextSpan(text: ' | ${L10n.of(context).rightAnswer}: '),
                  TextSpan(
                      text: widget.question.type == '2'
                          ? getAnswerLabel(
                              widget.question.answerSolutions ?? '')
                          : widget.question.answerSolutions,
                      style: defaultText16B.copyWith(color: main1Color)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

List<String> answers = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
String getAnswerLabel(String index) {
  final i = int.tryParse(index) ?? -1;
  if (i >= 0 && i < answers.length) {
    return answers[i];
  }
  return '';
}

int? extractQuestionNumber(String html) {
  final regex = RegExp(r'Question\s+(\d+)');
  final match = regex.firstMatch(html);
  if (match != null) {
    return int.tryParse(match.group(1) ?? '');
  }
  return null;
}

int getDisplayNumber(String content, int index) {
  if (index == 0) return 1; // số đầu tiên luôn là 1
  final base = extractQuestionNumber(content) ?? 0;
  return base + index - 1;
}

List<Map<String, String>> removeDuplicatesKeepLast(
    List<Map<String, String>> data) {
  final Map<String, Map<String, String>> uniqueMap = {};

  for (var item in data) {
    uniqueMap[item['id'] ?? ''] = item; // trùng thì override => giữ bản cuối
  }

  return uniqueMap.values.toList();
}

class AnswerInput extends StatefulWidget {
  final String questionId;
  final ValueNotifier<Map<String, String>> counter;
  final TextEditingController controller;
  final String answer;
  const AnswerInput({
    super.key,
    required this.questionId,
    required this.counter,
    required this.controller,
    required this.answer,
  });

  @override
  State<AnswerInput> createState() => _AnswerInputState();
}

class _AnswerInputState extends State<AnswerInput> {
  late VoidCallback _listener;

  @override
  void initState() {
    super.initState();

    // Khi người dùng nhập thì cập nhật lại counter
    _listener = () {
      final updated = Map<String, String>.from(widget.counter.value);
      updated[widget.questionId] = widget.controller.text;
      widget.counter.value = updated;
    };
    widget.controller.addListener(_listener);

    // Nếu counter thay đổi từ bên ngoài, đồng bộ lại textfield
    widget.counter.addListener(_syncWithCounter);
  }

  void _syncWithCounter() {
    final newValue = widget.counter.value[widget.questionId] ?? '';
    if (newValue != widget.controller.text) {
      widget.controller.text = newValue;
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);

    widget.counter.removeListener(_syncWithCounter);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.answer != ''
        ? Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Html(
              data: widget.answer,
            ),
          )
        : Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: L10n.of(context).enterAnswer,
              ),
            ),
          );
  }
}
