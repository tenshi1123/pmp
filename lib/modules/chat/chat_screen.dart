import 'package:pmp_english/utils/app_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmp_english/blocs/socket/socket_cubit.dart';
import 'package:pmp_english/student_models/chat_models.dart';
import 'package:pmp_english/student_repo/chat_repo.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {super.key,
      required this.chatId,
      required this.avatar,
      required this.name,
      required this.type});
  final String chatId;
  final String avatar;
  final String name;
  final String type;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  List<File> photos = <File>[];
  String id = '';
  List<ChatMessageModel> listMessage = <ChatMessageModel>[];

  void openCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CameraCamera(
          onFile: (file) async {
            //Navigator.pop(context);
            await ChatRepo().sendImageMessage(widget.chatId, file);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: const Text('Tin nhắn đã được gửi'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text(
                        'Ok',
                        style: TextStyle(fontSize: 20, color: key1Color),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            );
            setState(() {});
          },
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickMultiImage();
    photos = List<File>.from(
      (returnedImage).map(
        (e) => File(e.path),
      ),
    );
    //File(returnedImage!.path);
    if (photos.isNotEmpty) {
      await ChatRepo().sendImageMessage(widget.chatId, photos.last);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Tin nhắn đã được gửi'),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(
                  'Ok',
                  style: TextStyle(fontSize: 20, color: key1Color),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }
    setState(() {});
  }

  Future<void> _getIdUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id_user') ?? '';
    setState(() {
      // Cập nhật trạng thái để hiển thị dữ liệu mới
    });
  }

  @override
  void initState() {
    _getIdUser();

    context.read<SocketCubit>().loadHistory(widget.chatId, widget.type);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                radius: 21.r,
                backgroundColor: Colors.grey[200],
                backgroundImage: CachedNetworkImageProvider(widget.avatar),
                onBackgroundImageError: (_, __) {},
                child: Icon(
                  Icons.person,
                  size: 21.r,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                widget.name,
                style: defaultText18B.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
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
          // actions: [
          //   IconButton(
          //     icon: const Icon(
          //       Icons.phone,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {
          //       _makePhoneCall(widget.model.customerPhone ?? '0');
          //     },
          //   ),
          // ],
        ),
        body: Stack(
          children: [
            SizedBox(
              height: 700.h,
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<SocketCubit, SocketState>(
                builder: (context, state) {
                  if (state is SocketLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is SocketLoaded || state is SocketMessageReceived) {
                    final listMessage = state is SocketLoaded
                        ? state.messages
                        : (state as SocketMessageReceived).messages;

                    return ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(bottom: 60.h),
                      itemCount: listMessage.length,
                      itemBuilder: (context, index) {
                        final message = listMessage[index];
                        final isMine = message.senderId == id;
                        final isLastMessage = (index == 0 &&
                            isMine); // tin nhắn mới nhất và là của mình
                        return _buildMessageItem(
                            message, isMine, isLastMessage);
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),

              // ListView.builder(
              //   itemCount: widget.model.messages.length,
              //   shrinkWrap: true,
              //   padding: EdgeInsets.only(bottom: 60.h),
              //   reverse: true,
              //   //physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, index) {
              //     final message = listMessage[index];
              //     final isMine = (message.senderId == id);
              //     final isLastMessage = (index == 0 &&
              //         isMine); // tin nhắn mới nhất và là của mình

              //     return Container(
              //       padding: const EdgeInsets.only(
              //           left: 14, right: 14, top: 10, bottom: 10),
              //       child: Align(
              //         alignment:
              //             isMine ? Alignment.topRight : Alignment.topLeft,
              //         child: Column(
              //           crossAxisAlignment: isMine
              //               ? CrossAxisAlignment.end
              //               : CrossAxisAlignment.start,
              //           children: [
              //             // 👉 Hiển thị tên người gửi nếu không phải mình
              //             if (!isMine)
              //               Padding(
              //                 padding: const EdgeInsets.only(bottom: 4),
              //                 child: Text(
              //                   message.userName ??
              //                       message.customerName ??
              //                       message.teacherName ??
              //                       '',
              //                   style: defaultText14M.copyWith(
              //                     color: keyBlack,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ),

              //             // 👉 Bubble tin nhắn
              //             Container(
              //                 constraints: BoxConstraints(maxWidth: 300.w),
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(20.r),
              //                   color: isMine ? key1Color : state1,
              //                 ),
              //                 padding: EdgeInsets.symmetric(
              //                   horizontal: 12.w,
              //                   vertical: 6.w,
              //                 ),
              //                 child: (message.messageType == '1')
              //                     ? ChatImageGrid(
              //                         images: parseImageUrls(message.content),
              //                         isMine: isMine,
              //                       )

              //                     //  Html(
              //                     //     data: message.content,
              //                     //   )
              //                     //  Text(
              //                     //     message.content,
              //                     //     style: defaultText14M.copyWith(
              //                     //       color: isMine ? Colors.white : keyBlack,
              //                     //     ),
              //                     //   )
              //                     : AutoLinkText(
              //                         text: prepareHtmlForDisplay(
              //                             message.content),
              //                         isMine: isMine,
              //                       )),

              //             // 👉 Thêm chữ "Đã gửi" nếu là tin nhắn cuối cùng của mình
              //             if (isLastMessage)
              //               Padding(
              //                 padding: const EdgeInsets.only(top: 4),
              //                 child: Text(
              //                   "Đã gửi",
              //                   style: defaultText14M.copyWith(
              //                     fontSize: 12,
              //                     color: Colors.grey,
              //                   ),
              //                 ),
              //               ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                margin: EdgeInsets.only(bottom: 16.h),
                //height: 60.h,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          openCamera();
                        },
                        child:
                            SvgPicture.asset('assets/icons/camera_icon.svg')),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                        onTap: () {
                          _pickImageFromGallery();
                        },
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
                          decoration: InputDecoration(
                              hintText: "Nhập tin nhắn...",
                              hintStyle: TextStyle(
                                  color: Colors.black.withValues(alpha: 0.95)),
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
                          if (messageController.text.isNotEmpty) {
                            await ChatRepo().sendMessage(
                                widget.chatId, messageController.text);

                            // setState(() {
                            //   listMessage.insert(
                            //     0,
                            //     ChatMessageModel(
                            //       content: messageController.text,
                            //       messageType: "0",
                            //       senderType: "1",
                            //       createdAt: DateTime.now(),
                            //       teacherName: '',
                            //       senderId: id,
                            //       customerName: '',
                            //       userName: '',
                            //     ),
                            //   );
                            // });
                            context.read<SocketCubit>().sendMessage(
                                  ChatMessageModel(
                                    content: messageController.text,
                                    senderId: id,
                                    messageType: "0",
                                    createdAt: DateTime.now(),
                                    senderType: '1',
                                  ),
                                );
                            messageController.clear();
                          }
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



String prepareHtmlForDisplay(String html) {
  final text = html.replaceAll(RegExp(r'<[^>]+>'), '\n');
  return text.replaceAll(RegExp(r'\n{2,}'), '\n').trim();
}

class AutoLinkText extends StatelessWidget {
  final String text;
  final bool isMine;
  const AutoLinkText({super.key, required this.text, required this.isMine});
  Future<void> _onOpen(LinkableElement link) async {
    var url = link.url.trim();

    // Lọc lấy đúng phần https://... (phòng dính chữ)
    final match = RegExp(r'(https?://[^\s]+)').firstMatch(url);
    if (match != null) url = match.group(0)!;

    final uri = Uri.parse(url);

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        debugPrint('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Launch error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectableLinkify(
      text: text,
      onOpen: _onOpen,
      style: defaultText14M.copyWith(
        color: isMine ? Colors.white : keyBlack,
      ),
      linkStyle: defaultText14M.copyWith(color: Colors.blue),
    );
  }
}

List<String> parseImageUrls(String raw) {
  try {
    final decoded = jsonDecode(raw);
    if (decoded is List) {
      return decoded.map((e) => e.toString()).toList();
    }
  } catch (_) {}
  return [];
}

class ChatImageGrid extends StatelessWidget {
  final List<String> images;
  final bool isMine;

  const ChatImageGrid({
    super.key,
    required this.images,
    required this.isMine,
  });

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox();

    final radius = BorderRadius.circular(12);

    if (images.length == 1) {
      return _imageItem(context, images[0], radius);
    }

    return SizedBox(
      width: 220,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: images.length > 4 ? 4 : images.length,
        itemBuilder: (context, index) {
          if (index == 3 && images.length > 4) {
            return Stack(
              fit: StackFit.expand,
              children: [
                _imageItem(context, images[index], radius),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: radius,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '+${images.length - 4}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }
          return _imageItem(context, images[index], radius);
        },
      ),
    );
  }

  Widget _imageItem(
    BuildContext context,
    String url,
    BorderRadius radius,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ImageViewer(
              images: images,
              initialIndex: images.indexOf(url),
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: radius,
        child: AppImage(
          url: url,
          fit: BoxFit.cover,
          borderRadius: radius,
          showLoading: true,
        ),
      ),
    );
  }
}

class ImageViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const ImageViewer({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          '${widget.initialIndex + 1}/${widget.images.length}',
        ),
      ),
      body: PhotoViewGallery.builder(
        pageController: _controller,
        itemCount: widget.images.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: CachedNetworkImageProvider(widget.images[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 3,
          );
        },
        loadingBuilder: (context, _) =>
            const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

Widget _buildMessageItem(
    ChatMessageModel message, bool isMine, bool isLastMessage) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    child: Align(
      alignment: isMine ? Alignment.topRight : Alignment.topLeft,
      child: Column(
        crossAxisAlignment:
            isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // 👉 Hiển thị tên người gửi nếu không phải mình

          if (!isMine)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                message.userName ??
                    message.customerName ??
                    message.teacherName ??
                    '',
                style: defaultText14M.copyWith(
                  color: keyBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          // 👉 Bubble tin nhắn
          Container(
              constraints: BoxConstraints(maxWidth: 300.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: isMine ? key1Color : state1,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.w,
              ),
              child: (message.messageType == '1')
                  ? ChatImageGrid(
                      images: parseImageUrls(message.content),
                      isMine: isMine,
                    )

                  //  Html(
                  //     data: message.content,
                  //   )
                  //  Text(
                  //     message.content,
                  //     style: defaultText14M.copyWith(
                  //       color: isMine ? Colors.white : keyBlack,
                  //     ),
                  //   )
                  : AutoLinkText(
                      text: prepareHtmlForDisplay(message.content),
                      isMine: isMine,
                    )),

          // 👉 Thêm chữ "Đã gửi" nếu là tin nhắn cuối cùng của mình
          if (isLastMessage)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "Đã gửi",
                style: defaultText14M.copyWith(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
