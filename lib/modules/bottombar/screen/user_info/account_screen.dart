import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/modules/infoAccount/my_certificate_screen.dart';
import 'package:pmp_english/modules/infoAccount/payment_history.dart';
import 'package:pmp_english/modules/infoAccount/redeem_reward_screen.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../login/login_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

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
                    //height: 242.h,
                    width: 349.w,
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nguyễn Hồng Anh',
                                  style: defaultText18B,
                                ),
                                Text(
                                  'Mã học viên: 214-32D',
                                  style: defaultText12Re,
                                )
                              ],
                            ),
                            const Spacer(),
                            // GestureDetector(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) =>
                            //             const EditInfoScreen(),
                            //       ),
                            //     );
                            //   },
                            //   child: Container(
                            //     height: 25.h,
                            //     width: 25.w,
                            //     padding: const EdgeInsets.all(3),
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       gradient: mainGradient2,
                            //     ),
                            //     child:
                            //         SvgPicture.asset('assets/icons/pencil.svg'),
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Divider(
                          thickness: 1,
                          // indent: 15.w,
                          // endIndent: 15.w,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Địa chỉ',
                              style: defaultText14Re,
                            ),
                            SizedBox(
                              //height: 38.h,
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
                        SizedBox(
                          height: 10.h,
                        )
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RedeemRewardScreen(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/bg_diemthuong.png',
                      height: 68.h,
                      width: 168.w,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 10.h,
                      right: 20.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Điểm thưởng',
                            style: defaultText12Re.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '30 điểm',
                            style: defaultText16B.copyWith(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyCertificateScreen(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/bg_chungchi.png',
                      height: 68.h,
                      width: 168.w,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 10.h,
                      right: 20.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Xem chi tiết',
                            style: defaultText12Re.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Chứng chỉ',
                            style: defaultText16B.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentHistoryScreen(),
                ),
              );
            },
            child: Container(
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
                  Image.asset('assets/images/fee.png'),
                  Text(
                    'Học phí và thanh toán',
                    style: defaultText14B.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  //SvgPicture.asset('assets/icons/history.svg'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 133.h,
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Mật khẩu',
                //       style: defaultText14M,
                //     ),
                //     Icon(
                //       Icons.keyboard_arrow_right,
                //       size: 30.h,
                //       color: key1Color,
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Thông báo',
                //       style: defaultText14M,
                //     ),
                //     Icon(
                //       Icons.keyboard_arrow_right,
                //       size: 30.h,
                //       color: key1Color,
                //     ),
                //   ],
                // ),
                GestureDetector(
                  onTap: () {
                    _makePhoneCall('19008978');
                  },
                  child: Row(
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
                ),
                GestureDetector(
                  onTap: () => _dialogBuilder(context),
                  child: Container(
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Đăng xuất',
          style: defaultText14M,
        ),
        content: Text(
          'Bạn có chắc muốn đăng xuất ?',
          style: defaultText14M,
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Hủy'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Xác nhận'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const LoginScreen()),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
