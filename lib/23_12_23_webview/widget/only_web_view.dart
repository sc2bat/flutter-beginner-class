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
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // 자바스크립트 허용
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // progress 중
          },
          onPageStarted: (String url) {
            // page 로드 시작시
          },
          onPageFinished: (String url) {
            // page 로드 종료시
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev')); // 초기 페이지
  }

  @override
  Widget build(BuildContext context) {
    var isExit = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('my webview app'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                // button 클릭시 각 버튼별 value 즉 url 에 따라 페이지 로드
                _controller.loadRequest(Uri.parse(value));
              });
            },
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
                value: 'https://www.kakaocorp.com/',
                child: Text('kakao'),
              ),
            ],
          ),
        ],
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          logger.info('current isExit $isExit');
          if (await _controller.canGoBack()) {
            await _controller.goBack();
            return;
          }
        },
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
