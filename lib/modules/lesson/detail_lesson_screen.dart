import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class DetailLessonScreen extends StatelessWidget {
  const DetailLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 6.w,
                  ),
                  RichText(
                    text: TextSpan(
                        text: '<',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: '  Chi tiết buổi học ',
                            style: defaultText14B,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context).pop(),
                          )
                        ]),
                  ),
                  SizedBox(
                    width: 200.w,
                  ),
                  //SvgPicture.asset('assets/icons/three_dots_icon.svg'),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 250.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    // Text(
                    //   "$_start",
                    //   style: defaultBoldText,
                    // ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: const Text('Chức năng đang phát triển'),
                        content:
                            const Text('Đây là chức năng mở sang lớp học zoom'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: Text(
                              'Yes',
                              style: TextStyle(fontSize: 20, color: keyBlack),
                            ),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop(
                                (_) => false,
                              );
                            },
                          )
                        ],
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
