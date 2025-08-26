import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/modules/chat/list_teacher_sreen.dart';
import 'package:pmp_english/student_models/chat_models.dart';
import 'package:pmp_english/student_models/profile_model.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:pmp_english/utils/widget/custom_widget.dart';

class ListConversationScreen extends StatelessWidget {
  const ListConversationScreen(
      {super.key,
      required this.listConversation,
      required this.listTeacher,
      required this.type});
  final List<ProfileModel> listTeacher;
  final List<ChatModel> listConversation;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 390.w,
                      height: 140.h,
                      decoration: BoxDecoration(gradient: mainGradient),
                    ),
                  ),
                  Positioned(
                    bottom: 30.h,
                    left: 20.w,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_left,
                            size: 30.h,
                            color: Colors.white,
                          ),
                          Text(
                            'Tin nhắn',
                            style: defaultText20B.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    left: 250.w,
                    child: Image.asset(
                      'assets/images/chat_icon.png',
                      width: 117.w,
                      height: 115.h,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
            type == 'teacher'
                ? SizedBox(
                    height: 10.h,
                  )
                : Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTeacherScreen(
                                listTeacher: listTeacher,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.r),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withValues(alpha: 0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 2),
                                ),
                              ]),
                          child: Text(
                            'Danh sách giáo viên',
                            style: defaultText14M.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            SizedBox(
              height: 10.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w),
                physics: const ClampingScrollPhysics(),
                itemCount: listConversation.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: ConversationItem(
                      model: listConversation[index],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
