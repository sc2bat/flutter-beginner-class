import 'package:flutter/material.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:webview_flutter/webview_flutter.dart';

final logger = SimpleLogger();

class MyWebViewWidget extends StatefulWidget {
  const MyWebViewWidget({super.key});

  @override
  State<MyWebViewWidget> createState() => _MyWebViewWidgetState();
}

class _MyWebViewWidgetState extends State<MyWebViewWidget> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my webview app'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
          PopupMenuButton<String>(
            onSelected: (value) => logger.info(value),
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'https://www.google.com/',
                child: Text('google'),
              ),
              const PopupMenuItem<String>(
                value: 'https://www.naver.com/',
                child: Text('naver'),
              ),
              const PopupMenuItem<String>(
                value: 'https://www.kakaocorp.com/page/',
                child: Text('kakao'),
              ),
            ],
          ),
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
