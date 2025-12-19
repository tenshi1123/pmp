import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerPage({super.key, required this.videoUrl});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) async {
            if (widget.videoUrl.contains('youtube.com')) {
              await _controller.runJavaScript('''
            var iframes = document.querySelectorAll('iframe');
            for (var i = 0; i < iframes.length; i++) {
              iframes[i].setAttribute('allowfullscreen', '');
            }
          ''');
            }
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.videoUrl),
      );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        bool isLandscape = orientation == Orientation.landscape;

        if (isLandscape) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        }

        return Scaffold(
          appBar: isLandscape ? null : AppBar(title: const Text('Xem Video')),
          body: SafeArea(
            child: WebViewWidget(controller: _controller),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }
}

String convertEmbedUrlToShareUrl(String embedUrl) {
  // Dùng regex để trích xuất video ID từ URL
  final RegExp regExp = RegExp(r"embed\/([a-zA-Z0-9_-]+)");
  final match = regExp.firstMatch(embedUrl);

  if (match != null) {
    // Trả về URL chia sẻ với video ID
    return 'https://youtu.be/${match.group(1)}';
  } else {
    // Nếu không tìm thấy video ID trong URL, trả về một thông báo lỗi
    return 'Invalid YouTube embed URL';
  }
}
