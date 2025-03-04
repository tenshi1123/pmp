import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class EditInfoScreen extends StatelessWidget {
  const EditInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Thông tin cá nhân',
          style: defaultText18B,
        ),
        toolbarHeight: 60.h,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: key1Color),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 56.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    56.r,
                  ),
                  child: Image.asset('assets/images/placeholder_avatar.png'),
                ),
              ),
              SizedBox(
                width: 350.w,
                child: Text(
                  'Họ và tên',
                  style: defaultText14B,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Nguyễn Hồng Anh',
                ),
              ),
              SizedBox(
                width: 350.w,
                child: Text(
                  'Số điện thoại',
                  style: defaultText14B,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: '0913 339 029',
                ),
              ),
              SizedBox(
                width: 350.w,
                child: Text(
                  'Email',
                  style: defaultText14B,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              TextField(
                style: defaultText14Re,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'anhhong762@gmail.com',
                  fillColor: state2,
                  filled: true,
                  labelStyle: defaultText14Re,
                ),
              ),
              SizedBox(
                width: 350.w,
                child: Text(
                  'Sinh nhật',
                  style: defaultText14B,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              TextField(
                style: defaultText14Re,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: '27/5/2007',
                  fillColor: state2,
                  filled: true,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                width: 350.w,
                child: Text(
                  'Địa chỉ',
                  style: defaultText14B,
                ),
              ),
              TextField(
                style: defaultText14Re,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText:
                      'Bắc Xuân An, Phường Xuân An, Tp. Phan thiết, Tỉnh Bình Thuận.',
                  fillColor: state2,
                  filled: true,
                  hintMaxLines: 2,
                ),
                maxLines: 5,
                minLines: 1,
              ),
              SizedBox(
                height: 120.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 45.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    color: main1Color,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Center(
                    child: Text(
                      'Lưu thay đổi',
                      style: defaultText20B.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
