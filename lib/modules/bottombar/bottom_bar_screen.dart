import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pmp_english/modules/bottombar/screen/user_info/account_screen.dart';
import 'package:pmp_english/modules/bottombar/screen/news_screen.dart';
import 'package:pmp_english/modules/bottombar/screen/schedule_screen.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'screen/course_screen.dart';
import 'screen/home_screen.dart';

class Bottombar extends StatefulWidget {
  final int index;

  const Bottombar(this.index, {super.key});

  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _selectedIndex = 0;
  final _pageOption = [
    const HomeScreen(),
    const CourseScreen(),
    const ScheduleScreen(),
    const NewsScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.index);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // logic
      },
      child: Scaffold(
// backgroundColor: notifire.getwihitecolor,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: key1Color,
          backgroundColor: Colors.white.withOpacity(0.6),
          selectedLabelStyle: defaultText12M,
          fixedColor: Colors.blue,
          //unselectedLabelStyle: const TextStyle(fontFamily: 'Gilroy_Medium'),
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                // backgroundColor: notifire.getprimerycolor,
                icon: SvgPicture.asset(
                  _selectedIndex == 0
                      ? 'assets/icons/home_gradient.svg'
                      : 'assets/icons/home_icon.svg',
                ),
                label: 'Trang chủ'),
            BottomNavigationBarItem(
                // backgroundColor: notifire.getprimerycolor,
                icon: SvgPicture.asset(
                  _selectedIndex == 1
                      ? 'assets/icons/course_gradient.svg'
                      : 'assets/icons/course_icon.svg',
                  height: 30.h,
                ),
                label: 'Khóa học'),
            BottomNavigationBarItem(
                // backgroundColor: notifire.getprimerycolor,
                icon: SvgPicture.asset(
                  _selectedIndex == 2
                      ? 'assets/icons/schedule_gradient.svg'
                      : 'assets/icons/schedule_icon.svg',
                  height: 30.h,
                ),
                label: 'Thời khóa biểu'),
            BottomNavigationBarItem(
                // backgroundColor: notifire.getprimerycolor,
                icon: SvgPicture.asset(
                  _selectedIndex == 3
                      ? 'assets/icons/news_gradient.svg'
                      : 'assets/icons/news.svg',
                  height: 30.h,
                ),
                label: 'Tin tức'),
            BottomNavigationBarItem(
              // backgroundColor: notifire.getprimerycolor,
              icon: SvgPicture.asset(
                _selectedIndex == 4
                    ? 'assets/icons/account_gradient.svg'
                    : 'assets/icons/account_icon.svg',
                height: 30.h,
                fit: BoxFit.fitHeight,
              ),
              label: 'Tài khoản',
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: _pageOption[_selectedIndex],
      ),
    );
  }
}
