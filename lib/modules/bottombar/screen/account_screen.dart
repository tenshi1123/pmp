import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

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
      decoration: BoxDecoration(gradient: asdjajsdhasjidas),
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
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 120.w,
                            ),
                            Text(
                              'Nguyễn Hồng Anh',
                              style: defaultText18B,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              height: 25.h,
                              width: 25.w,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: mainGradient2,
                              ),
                              child:
                                  SvgPicture.asset('assets/icons/pencil.svg'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Divider(
                          thickness: 1,
                          indent: 15.w,
                          endIndent: 15.w,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Họ và tên',
                              style: defaultText14Re,
                            ),
                            Text(
                              'Nguyễn Hồng Anh',
                              style: defaultText14M,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ngày sinh',
                              style: defaultText14Re,
                            ),
                            Text(
                              '27/5/2007',
                              style: defaultText14M,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Số điện thoại',
                              style: defaultText14Re,
                            ),
                            Text(
                              '0913 339 029',
                              style: defaultText14M,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Địa chỉ',
                              style: defaultText14Re,
                            ),
                            SizedBox(
                              height: 38.h,
                              width: 202.w,
                              child: Text(
                                'Bắc Xuân An, Phường Xuân An, Tp. Phan thiết, Tỉnh Bình Thuận.',
                                style: defaultText14B,
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
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
                      child:
                          Image.asset('assets/images/placeholder_avatar.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/bg_diemthuong.png',
                height: 68.h,
                width: 168.w,
              ),
              Image.asset(
                'assets/images/bg_chungchi.png',
                height: 68.h,
                width: 168.w,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 45.h,
            width: 350.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: key2Color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lịch sử giao dịch',
                  style: defaultText14M.copyWith(
                    color: Colors.white,
                  ),
                ),
                SvgPicture.asset('assets/icons/history.svg'),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 233.h,
            width: 350.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Quản lý tài khoản',
                  style: defaultText14M,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mật khẩu',
                      style: defaultText14M,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 30.h,
                      color: key1Color,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Thông báo',
                      style: defaultText14M,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 30.h,
                      color: key1Color,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hotline hỗ trợ',
                      style: defaultText14M,
                    ),
                    Text(
                      '1900 8978',
                      style: defaultText14M.copyWith(
                        color: sub1Color,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 49.h,
                  width: 315.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: state1,
                  ),
                  child: Center(
                    child: Text(
                      'Đăng xuất',
                      style: defaultText14M,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
