import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pmp_english/modules/bottombar/schedule_screen.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'course_screen.dart';
import 'home_screen.dart';

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
    const HomeScreen(),
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
          backgroundColor: Colors.white.withOpacity(0.8),
          selectedLabelStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
                ),
                label: 'Khóa học'),
            BottomNavigationBarItem(
                // backgroundColor: notifire.getprimerycolor,
                icon: SvgPicture.asset(
                  _selectedIndex == 2
                      ? 'assets/icons/schedule_gradient.svg'
                      : 'assets/icons/schedule_icon.svg',
                ),
                label: 'Thời khóa biểu'),
            BottomNavigationBarItem(
              // backgroundColor: notifire.getprimerycolor,
              icon: SvgPicture.asset(
                _selectedIndex == 3
                    ? 'assets/icons/account_gradient.svg'
                    : 'assets/icons/account_icon.svg',
              ),
              label: 'Tài khoản',
            ),
            // BottomNavigationBarItem(
            //   // backgroundColor: notifire.getprimerycolor,
            //   icon: Image.asset("assets/Profile.png",
            //       color: _selectedIndex == 4 ? Colors.blue : Colors.black,
            //       height: MediaQuery.of(context).size.height / 35),
            //   label: 'Cá nhân',
            // ),
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
