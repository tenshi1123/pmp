import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pmp_english/l10n/l10n.dart';
import 'package:pmp_english/modules/bottombar/screen/extension.dart/testtkb.dart';
import 'package:pmp_english/student_repo/login_repo.dart';
import 'package:pmp_english/teacher/teacher_model/home_teacher_model.dart';

import 'package:pmp_english/teacher_modules/teacher_info/teacher_info.dart';
import 'screen/teacher_class.dart';
import 'home/teacher_homescreen.dart';
import "package:upgrader/upgrader.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";

class TeacherBottomBar extends StatefulWidget {
  const TeacherBottomBar({
    super.key,
    required this.infoModel,
    required this.teacherProfileModel,
  });
  final TeacherHomeModel infoModel;
  final TeacherProfileModel teacherProfileModel;
  @override
  State<TeacherBottomBar> createState() => _TeacherBottomBarState();
}

class _TeacherBottomBarState extends State<TeacherBottomBar> {
  final PersistentTabController _controller = PersistentTabController();
  @override
  void initState() {
    super.initState();
    setupOneSignal();
  }

  Future<void> setupOneSignal() async {
    // Enable verbose logging for debugging (remove in production)
    // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    // Initialize with your OneSignal App ID
    OneSignal.initialize("9eed43b6-3e7d-4d7b-a8fb-621e889f71c9");
    OneSignal.Notifications.requestPermission(true).then((value) {});
    var onesignalId = await OneSignal.User.getOnesignalId();
    await LoginRepo().pushTeacherOnesignal(
      onesignalId: onesignalId ?? '',
    );
    if (Platform.isAndroid) {
      OneSignal.Notifications.addClickListener((event) {});
    } else {
      //do nothing :v tự báo chính mình
      OneSignal.Notifications.addClickListener((event) {});
    }
    promptPolicyPrivacy();
  }

  Future<void> promptPolicyPrivacy() async {
    if (Platform.isAndroid) {
      OneSignal.consentRequired(true);
      OneSignal.consentGiven(true);
    } else {
      //do nothing :v
    }
    // sendUserTag(userId);
  }

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: TeacherHomeScreen(
            infoModel: widget.infoModel,
            teacherProfileModel: widget.teacherProfileModel,
          ),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
            ),
            title: L10n.of(context).home,
            inactiveIcon: SvgPicture.asset(
              'assets/icons/inactive_home.svg',
            ),
            inactiveBackgroundColor: Colors.white.withValues(alpha: 0.2),
          ),
        ),
        PersistentTabConfig(
          screen: const ClassManagementScreen(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icons/class.svg',
            ),
            title: L10n.of(context).lopHoc2,
            activeForegroundColor: const Color(0xff273D8C),
            inactiveIcon: SvgPicture.asset(
              'assets/icons/inactive_class.svg',
            ),
            inactiveForegroundColor:
                const Color(0xff273D8C).withValues(alpha: 0.4),
            inactiveBackgroundColor: Colors.white.withValues(alpha: 0.2),
          ),
        ),
        PersistentTabConfig(
          screen: const ScheduleScreen(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icons/calendar.svg',
            ),
            title: L10n.of(context).teachingSchedule,
            activeForegroundColor: const Color(0xff273D8C),
            inactiveForegroundColor:
                const Color(0xff273D8C).withValues(alpha: 0.4),
            inactiveIcon: SvgPicture.asset(
              'assets/icons/inactive_calender.svg',
            ),
            inactiveBackgroundColor: Colors.white.withValues(alpha: 0.2),
          ),
        ),
        PersistentTabConfig(
          screen: TeacherInfo(
            teacherProfileModel: widget.teacherProfileModel,
          ),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icons/person.svg',
            ),
            title: L10n.of(context).profile,
            activeForegroundColor: const Color(0xff273D8C),
            inactiveForegroundColor:
                const Color(0xff273D8C).withValues(alpha: 0.4),
            inactiveIcon: SvgPicture.asset(
              'assets/icons/inactive_person.svg',
            ),
            inactiveBackgroundColor: Colors.white.withValues(alpha: 0.2),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      dialogStyle: UpgradeDialogStyle.cupertino,
      showLater: true,
      upgrader: Upgrader(
        languageCode: "vi",
        durationUntilAlertAgain: const Duration(minutes: 5),
      ),
      child: PersistentTabView(
        controller: _controller,
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Padding(
          padding: EdgeInsets.only(bottom: 6.h, right: 16.w, left: 16.w),
          child: Style6BottomNavBar(
            //itemPadding: EdgeInsets.all(5.h),
            navBarConfig: navBarConfig,
            navBarDecoration: NavBarDecoration(
              padding: const EdgeInsets.all(5),
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.r),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withValues(alpha: 0.16),
                  blurRadius: 12,
                  offset: const Offset(0, 4), // Shadow position
                ),
              ],
            ),
            //itemAnimationProperties: const ItemAnimation(),
          ),
        ),
        backgroundColor: Colors.white,
        //navBarHeight: 50.h,
      ),
    );
  }
}
