import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/color.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 844.h,
      decoration: BoxDecoration(gradient: mainGradient),
      child: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          SizedBox(
            height: 300.h,
            width: 349.w,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 242.h,
                    width: 349.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 15.w,
                  child: CircleAvatar(
                    radius: 56.r,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          56.r,
                        ),
                        child: Image.asset(
                            'assets/images/placeholder_avatar.png')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
