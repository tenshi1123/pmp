import 'package:flutter/material.dart';
import 'package:pmp_english/utils/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmp_english/l10n/l10n.dart';
import 'package:pmp_english/modules/bottombar/screen/user_info/change_pass_screen.dart';
import 'package:pmp_english/modules/bottombar/screen/user_info/edit_info_student_screen.dart';
import 'package:pmp_english/modules/infoAccount/payment_history.dart';
import 'package:pmp_english/modules/infoAccount/redeem_reward_screen.dart';
import 'package:pmp_english/student_models/gift_models.dart';
import 'package:pmp_english/student_models/profile_model.dart';
import 'package:pmp_english/student_repo/customer_repo.dart';
import 'package:pmp_english/student_repo/home_repo.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/custom_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../splash/wellcom_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key, required this.profileModel});
  final ProfileModel profileModel;
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late ProfileModel _profileModel;

  @override
  void initState() {
    _profileModel = widget.profileModel;
    super.initState();
  }

  Future<void> _onRefresh() async {
    try {
      ProfileModel updatedProfile = await CustomerRepo().getCustomerProfile();
      if (mounted) {
        setState(() {
          _profileModel = updatedProfile;
        });
      }
    } catch (e) {
      // ignore
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
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
                      top: 50.h,
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
                                SizedBox(
                                  width: 160.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _profileModel.fullName,
                                        style: defaultText18B,
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Text(
                                        '${L10n.of(context).studentCode}: ${_profileModel.code}',
                                        style: defaultText12Re.copyWith(
                                          color: key1Color,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditInfoStudentScreen(
                                          profileModel: _profileModel,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 25.h,
                                    width: 25.w,
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: mainGradient2,
                                    ),
                                    child: SvgPicture.asset(
                                        'assets/icons/pencil.svg'),
                                  ),
                                ),
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
                                  L10n.of(context).fullName,
                                  style: defaultText14Re,
                                ),
                                Text(
                                  _profileModel.fullName,
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
                                  L10n.of(context).dob,
                                  style: defaultText14Re,
                                ),
                                Text(
                                  _profileModel.dob,
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
                                  L10n.of(context).phone,
                                  style: defaultText14Re,
                                ),
                                Text(
                                  _profileModel.phone,
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
                                  L10n.of(context).address,
                                  style: defaultText14Re,
                                ),
                                SizedBox(
                                  //height: 38.h,
                                  width: 202.w,
                                  child: Text(
                                    _profileModel.address,
                                    style: defaultText14B,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
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
                          child: AppImage(
                            url: _profileModel.img,
                            fit: BoxFit.fill,
                            errorAsset: null, // Default
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
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  GestureDetector(
                    onTap: () async {
                      GiftModel giftModel = await HomeRepo().getListGift();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RedeemRewardScreen(
                            giftModel: giftModel,
                          ),
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
                                L10n.of(context).rewardPoints,
                                style: defaultText12Re.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${_profileModel.totalCustomerScore} ${L10n.of(context).point}',
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
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () async {
                  List<PaymentModel> listPayments =
                      await CustomerRepo().getPayment();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentHistoryScreen(
                        listPayments: listPayments,
                      ),
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
                        L10n.of(context).feeAndPay,
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
                //height: 140.h,
                width: 350.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      L10n.of(context).accountManagement,
                      style: defaultText14M,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChangePassScreen(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            L10n.of(context).password,
                            style: defaultText14M,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 30.h,
                            color: key1Color,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        _makePhoneCall('0909 383 358');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            L10n.of(context).hotline,
                            style: defaultText14M,
                          ),
                          Text(
                            '0909 383 358',
                            style: defaultText14M.copyWith(
                              color: sub1Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        showLanguageDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            L10n.of(context).language,
                            style: defaultText14M,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 30.h,
                            color: key1Color,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: () => _dialogBuilder(context),
                      child: Container(
                        width: 315.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: state1,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                            ),
                            child: Text(
                              L10n.of(context).logout,
                              style: defaultText14B,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
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
          L10n.of(context).logout,
          style: defaultText14M,
        ),
        content: Text(
          L10n.of(context).confirmLogout,
          style: defaultText14M,
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              L10n.of(context).cancel,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              L10n.of(context).confirm,
            ),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('token');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const WellcomeScreen()),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
