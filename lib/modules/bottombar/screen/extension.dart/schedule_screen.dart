import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pmp_english/modules/bottombar/utils.dart';
import 'package:pmp_english/student_repo/customer_repo.dart';
import 'package:pmp_english/student_models/customer_models.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  late final ValueNotifier<List<CalendarModel>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  late List<CalendarModel> _listLichHoc;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _listLichHoc = [];
    _selectedEvents = ValueNotifier(_getEventsForRange(
        DateTime(_focusedDay.year, _focusedDay.month, 1),
        DateTime(_focusedDay.year, _focusedDay.month + 1, 0)));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  Future<void> getSchedule(
      {required String dayStart, required String dayEnd}) async {
    _listLichHoc =
        await CustomerRepo().getListTkb(day1: dayStart, day2: dayEnd);
    _selectedEvents.value = _listLichHoc;
  }

  List<CalendarModel> _getEventsForDay(DateTime day) {
    // Implementation example
    getSchedule(
        dayStart: DateFormat('yyyy-MM-dd').format(day),
        dayEnd: DateFormat('yyyy-MM-dd').format(day));
    return _listLichHoc;
  }

  // List<ScheduleModel> _getEventLoad(DateTime day) {
  //   List<ScheduleModel> test = [
  //     ..._listFullLich.where((e) => e.createdDate.day == day.day)
  //   ];
  //   return test;
  // }

  List<CalendarModel> _getEventsForRange(DateTime start, DateTime end) {
    getSchedule(
      dayStart: DateFormat('yyyy-MM-dd').format(start),
      dayEnd: DateFormat('yyyy-MM-dd').format(end),
    );
    return _listLichHoc;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff273D8C),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Lịch học',
            style: defaultText18B.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 403.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    color: main2Color.withOpacity(0.24),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                  ),
                  child: TableCalendar<CalendarModel>(
                    locale: 'vi_VI',
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    rangeStartDay: _rangeStart,
                    rangeEndDay: _rangeEnd,
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month',
                    },
                    headerStyle: HeaderStyle(titleTextStyle: defaultText16M),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: defaultText14M,
                      weekendStyle: defaultText14M.copyWith(
                        color: Colors.red,
                      ),
                    ),
                    daysOfWeekHeight: 36.h,
                    calendarFormat: _calendarFormat,
                    rangeSelectionMode: _rangeSelectionMode,
                    // eventLoader: _getEventLoad,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, date, events) {
                        return events.isNotEmpty
                            ? _buildEventsMarkerNum(events)
                            : const SizedBox();
                      },
                    ),
                    calendarStyle: CalendarStyle(
                      // Use `CalendarStyle` to customize the UI
                      outsideDaysVisible: true,
                      defaultTextStyle: defaultText14M,
                      weekendTextStyle:
                          defaultText14M.copyWith(color: Colors.red),
                      todayTextStyle:
                          defaultText14M.copyWith(color: Colors.white),
                    ),
                    onDaySelected: _onDaySelected,
                    onRangeSelected: _onRangeSelected,
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  // DateFormat("yyyy-MM-dd").format(
                  //   _selectedDay ?? DateTime.now(),
                  // ),
                  'Lịch học của bạn',
                  style: defaultText16B,
                ),
                ValueListenableBuilder<List<CalendarModel>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _) {
                    return value.isEmpty
                        ? Center(
                            child: Text(
                              'Không có lịch học',
                              style: defaultText16B,
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              return ItemTableCalender(
                                model: value[index],
                              );
                            },
                          );
                  },
                ),
                SizedBox(height: 24.h),
                // FutureBuilder(
                //   future: ScheduleRepo().getScheduleList(
                //       DateFormat('dd-MM-yyyy')
                //           .format(_rangeStart ?? DateTime.now()),
                //       DateFormat('dd-MM-yyyy')
                //           .format(_rangeEnd ?? DateTime.now())), // Hàm gọi API
                //   //               if (start != null && end != null) {
                //   //   _selectedEvents.value = ScheduleRepo().getScheduleList(dayStart, dayEnd),
                //   // } else if (start != null) {
                //   //   _selectedEvents.value = ScheduleRepo().getScheduleList(dayStart, dayEnd),
                //   // } else if (end != null) {
                //   //   _selectedEvents.value = ScheduleRepo().getScheduleList(dayStart, dayEnd),
                //   // }
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return const CircularProgressIndicator();
                //     } else if (snapshot.hasError) {
                //       return Text(
                //         'Vui lòng kiểm tra lại kết nối internet',
                //         style: defaultText14M,
                //       );
                //     } else if (snapshot.hasData) {
                //       _listLichHoc = snapshot.data as List<ScheduleModel>;
                //       return
                //     } else {
                //       return Text(
                //         'Vui lòng kiểm tra lại kết nối internet2',
                //         style: defaultText14M,
                //       );
                //     }
                //   },
                // ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

Widget _buildEventsMarkerNum(List events) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [buildCalendarDayMarker(backColor: main1Color)]);
}

AnimatedContainer buildCalendarDayMarker({
  required Color backColor,
}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: backColor,
    ),
    width: 5.w,
    height: 5.h,
  );
}

class ItemTableCalender extends StatefulWidget {
  final CalendarModel model;
  const ItemTableCalender({super.key, required this.model});

  @override
  State<ItemTableCalender> createState() => _ItemTableCalenderState();
}

class _ItemTableCalenderState extends State<ItemTableCalender> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _isLoading = true;
        });
        // CalendarModel detailLesson = await CustomerRepo().getDetailSchedule(
        //   checkinOffId: widget.model.checkinOffId,
        //   typeLearn: widget.model.typeLearn,
        //   meetingId: widget.model.meetingId,
        // );

        setState(() {
          _isLoading = false;
        });
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: ((context) => DetailScreen(
        //           detailLesson: detailLesson,
        //         )),
        //   ),
        // );
      },
      child: _isLoading
          ? SizedBox(
              height: 136.h,
              width: 343.w,
              child: Center(
                child: SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: const CircularProgressIndicator(),
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.only(top: 16.h, bottom: 10.h),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              width: 343.w,
              //height: 136.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff273D8C).withValues(alpha: 0.12),
                    blurRadius: 16,
                    spreadRadius: 0,
                    offset: const Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        //width: 90.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: const Color(0xff273D8C),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.r),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.model.day.day.toString(),
                              style: defaultText16B.copyWith(
                                  color: Colors.white, fontSize: 24.sp),
                            ),
                            Text(
                              '  Tháng ${widget.model.day.month}  ',
                              style: defaultText16B.copyWith(
                                  color: Colors.white, fontSize: 24.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.courseScheduleAlias,
                            style: defaultText18B,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            widget.model.name,
                            style: defaultText18B,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            '${widget.model.timeStart.substring(0, 5)}-${widget.model.timeEnd.substring(0, 5)}',
                            style: defaultText14M,
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Giáo viên: ',
                          style: defaultText16M,
                          children: [
                            TextSpan(
                                text: widget.model.teacherName,
                                style: defaultText16B.copyWith(
                                    color: const Color(0xff273D8C))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Phòng học: ',
                          style: defaultText16M,
                          children: [
                            TextSpan(
                                text: widget.model.phongHocName,
                                style: defaultText16B.copyWith(
                                    color: const Color(0xff273D8C))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Chi nhánh: ',
                          style: defaultText16M,
                          children: [
                            TextSpan(
                                text: widget.model.cosoAddress,
                                style: defaultText16B.copyWith(
                                    color: const Color(0xff273D8C))),
                          ],
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
