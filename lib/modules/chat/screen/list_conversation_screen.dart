import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/modules/chat/screen/chat_screen.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class ListConversationScreen extends StatelessWidget {
  const ListConversationScreen({super.key});

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
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ConversationItem(
                    index: index,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class ConversationItem extends StatelessWidget {
  const ConversationItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatScreen(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w),
        height: 73.h,
        width: 350.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 21.r,
              backgroundColor: Colors.blue.shade800,
              child: const Text('AH'),
            ),
            SizedBox(
              width: 220.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PMP English - hỗ trợ $index',
                    style: defaultText14B,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consect...',
                    style: defaultText12M,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '09:03',
                  style: defaultText12Re,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 9.h,
                  width: 9.w,
                  decoration: BoxDecoration(
                    color: sub2Color,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
