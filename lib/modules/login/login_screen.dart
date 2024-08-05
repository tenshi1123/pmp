import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  final _focusNode = FocusNode();
  final _focusNode1 = FocusNode();
  TextEditingController? passController = TextEditingController();
  TextEditingController? studenIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,

            //bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Container(
                  width: 340.w,
                  height: 309.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
                Text(
                  'Đăng nhập để tiếp tục sử dụng ứng dụng',
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: key1Color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Thông tin đăng nhập được cung cấp bởi nhà trường',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xff999999),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.clip,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Text(
                      'Tài khoản',
                      style: TextStyle(
                        color: key1Color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 350.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: const Color(0xffF4F1F3),
                  ),
                  child: TextField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    controller: studenIdController,
                    focusNode: _focusNode1,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).viewInsets.bottom),
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      'Mật khẩu',
                      style: TextStyle(
                        color: key1Color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 350.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: const Color(0xffF4F1F3),
                  ),
                  child: TextField(
                    obscureText: _isObscure,
                    obscuringCharacter: "*",
                    controller: passController,
                    focusNode: _focusNode,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).viewInsets.bottom),
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                      suffix: IconButton(
                        padding: const EdgeInsets.all(0),
                        iconSize: 20.0,
                        icon: _isObscure
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Quên mật khẩu',
                      style: TextStyle(
                        color: main1Color,
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 48.h,
                    width: 191.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.r),
                        color: sub1Color),
                    child: Center(
                      child: Text(
                        'Đăng nhập',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
