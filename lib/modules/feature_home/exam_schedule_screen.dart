import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/modules/course/lich_hoc.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class ExamScheduleScreen extends StatefulWidget {
  const ExamScheduleScreen({super.key});

  @override
  State<ExamScheduleScreen> createState() => _ExamScheduleScreenState();
}

enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}

class _ExamScheduleScreenState extends State<ExamScheduleScreen> {
  final TextEditingController cosoController = TextEditingController();
  final TextEditingController cathiController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  IconLabel? selectedIcon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 160.h,
              width: 390.w,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 390.w,
                      height: 140.h,
                      decoration: BoxDecoration(gradient: mainGradient),
                    ),
                  ),
                  Positioned(
                    bottom: 30.h,
                    left: 20.w,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_left,
                            size: 30.h,
                            color: Colors.white,
                          ),
                          Text(
                            'Lịch thi',
                            style: defaultText20B.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 20,
                    child: Image.asset(
                      'assets/images/lich_thi.png',
                      width: 156.w,
                      height: 118.h,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 350.w,
              height: 306.h,
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
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Đăng kí thi thử tháng 9/2024',
                    style: defaultText16B,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 60.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          gradient: mainGradient,
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: Center(
                          child: Text(
                            'Offline',
                            style: defaultText14B.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 60.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: key1Color.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: Center(
                          child: Text(
                            'Online',
                            style: defaultText14B.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // DropdownMenu<IconLabel>(
                  //   controller: iconController,
                  //   enableFilter: true,
                  //   requestFocusOnTap: true,
                  //   label: const Text('Cơ sở'),
                  //   width: 310.w,
                  //   inputDecorationTheme: InputDecorationTheme(
                  //     filled: true,
                  //     constraints: BoxConstraints.tight(
                  //       Size.fromHeight(50.h),
                  //     ),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //   ),
                  //   onSelected: (IconLabel? icon) {
                  //     setState(() {
                  //       selectedIcon = icon;
                  //     });
                  //   },
                  //   dropdownMenuEntries:
                  //       IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
                  //     (IconLabel icon) {
                  //       return DropdownMenuEntry<IconLabel>(
                  //         value: icon,
                  //         label: icon.label,
                  //         leadingIcon: Icon(icon.icon),
                  //       );
                  //     },
                  //   ).toList(),
                  // ),
                  DropdownMenu<IconLabel>(
                    controller: cosoController,
                    enableFilter: true,
                    requestFocusOnTap: true,
                    label: Text(
                      'Cơ sở',
                      style: defaultText14Re,
                    ),
                    width: 310.w,
                    inputDecorationTheme: InputDecorationTheme(
                      //filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      constraints: BoxConstraints.tight(
                        Size.fromHeight(40.h),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onSelected: (IconLabel? icon) {
                      setState(() {
                        selectedIcon = icon;
                      });
                    },
                    dropdownMenuEntries:
                        IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
                      (IconLabel icon) {
                        return DropdownMenuEntry<IconLabel>(
                          value: icon,
                          label: icon.label,
                          leadingIcon: Icon(icon.icon),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                          labelText: 'Chọn ngày thi',
                          //filled: true,
                          prefixIcon: Icon(Icons.calendar_today),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          )),
                      readOnly: true,
                      onTap: () {
                        _selectDate();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DropdownMenu<IconLabel>(
                    controller: cathiController,
                    enableFilter: true,
                    requestFocusOnTap: true,
                    label: Text(
                      'Ca thi',
                      style: defaultText14Re,
                    ),
                    width: 310.w,
                    inputDecorationTheme: InputDecorationTheme(
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      constraints: BoxConstraints.tight(
                        Size.fromHeight(40.h),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onSelected: (IconLabel? icon) {
                      setState(() {
                        selectedIcon = icon;
                      });
                    },
                    dropdownMenuEntries:
                        IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
                      (IconLabel icon) {
                        return DropdownMenuEntry<IconLabel>(
                          value: icon,
                          label: icon.label,
                          leadingIcon: Icon(icon.icon),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 130.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      gradient: mainGradient,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    child: Center(
                      child: Text(
                        'Đăng kí tham gia',
                        style: defaultText14B.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Lịch thi của tôi',
              style: defaultText16B,
            ),
            SizedBox(
              height: 330.h,
              width: 390.w,
              child: const LichhocTabBar('Flights'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
