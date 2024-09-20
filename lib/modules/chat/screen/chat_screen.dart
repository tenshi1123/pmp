import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Giáo viên 01'),
          toolbarHeight: 60.h,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: mainGradient,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.phone),
              onPressed: () {
                _makePhoneCall('19008978');
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 50.h),
              reverse: true,
              //physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        constraints: const BoxConstraints(maxWidth: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: main2Color.withOpacity(0.5),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'test',
                          style: defaultText14Re,
                        )),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                margin: EdgeInsets.only(bottom: 6.h),
                height: 60.h,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {},
                        child:
                            SvgPicture.asset('assets/icons/camera_icon.svg')),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child:
                            SvgPicture.asset('assets/icons/picture_icon.svg')),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: state2,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: TextField(
                          controller: messageController,
                          decoration: const InputDecoration(
                              hintText: "Nhập tin nhắn...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                          style: defaultText14M,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                        onTap: () async {
                          messageController.clear();

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: const Text('Tin nhắn đã được gửi'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    isDefaultAction: true,
                                    child: Text(
                                      'ok',
                                      style: TextStyle(
                                          fontSize: 20, color: key1Color),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(
                                        (_) => false,
                                      );
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child:
                            SvgPicture.asset('assets/icons/plane_outline.svg')),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
