import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pmp_english/l10n/l10n.dart';
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
      );
    if (widget.videoUrl.trim().startsWith('<')) {
      // HTML / iframe
      _controller.loadHtmlString(
        _wrapHtml(widget.videoUrl),
      );
    } else {
      // URL thường
      _controller.loadRequest(
        Uri.parse(widget.videoUrl),
      );
    }
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
          appBar: isLandscape
              ? null
              : AppBar(title: Text(L10n.of(context).watchVideo)),
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

  String _wrapHtml(String iframeHtml) {
    return '''
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    html, body {
      margin: 0;
      padding: 0;
      background-color: black;
      height: 100%;
    }
    iframe {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      border: 0;
    }
  </style>
</head>
<body>
  $iframeHtml
</body>
</html>
''';
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

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class VideoPlayerPage extends StatefulWidget {
//   /// iframe HTML lấy trực tiếp từ API: data.content
//   final String videoUrl;

//   const VideoPlayerPage({
//     super.key,
//     required this.videoUrl,
//   });

//   @override
//   State<VideoPlayerPage> createState() => _VideoPlayerPageState();
// }

// class _VideoPlayerPageState extends State<VideoPlayerPage> {
//   late final WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();

//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(Colors.black)
//       ..loadHtmlString(_buildHtml(widget.videoUrl));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return OrientationBuilder(
//       builder: (context, orientation) {
//         final isLandscape = orientation == Orientation.landscape;

//         /// Fullscreen khi xoay ngang
//         SystemChrome.setEnabledSystemUIMode(
//           isLandscape ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
//         );

//         return Scaffold(
//           backgroundColor: Colors.black,
//           appBar: isLandscape
//               ? null
//               : AppBar(
//                   title: const Text('Xem video'),
//                   backgroundColor: Colors.black,
//                 ),
//           body: SafeArea(
//             child: WebViewWidget(controller: _controller),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//     super.dispose();
//   }

//   /// HTML wrapper tối ưu cho iframe video
//   String _buildHtml(String iframeHtml) {
//     return '''
// <!DOCTYPE html>
// <html>
// <head>
//   <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
//   <style>
//     html, body {
//       margin: 0;
//       padding: 0;
//       background-color: black;
//       height: 100%;
//       overflow: hidden;
//     }
//     iframe {
//       width: 100%;
//       height: 100%;
//       border: none;
//     }
//   </style>
// </head>
// <body>
//   $iframeHtml
// </body>
// </html>
// ''';
//   }
// }
