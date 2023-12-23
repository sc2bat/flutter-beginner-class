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

  String _url = 'https://flutter.dev';

  var _loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _loadingPercentage = progress;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              _loadingPercentage = 0;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _loadingPercentage = 100;
            });
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
      ..loadRequest(Uri.parse(_url));
  }

  @override
  Widget build(BuildContext context) {
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
              // logger.info(value);
              setState(() {
                _url = value;
                logger.info(_url);
                _controller.loadRequest(Uri.parse(_url));
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
      body: Stack(
        children: [
          PopScope(
            canPop: false,
            onPopInvoked: (didPop) async {
              logger.info('뒤로가기');
              logger.info('qwerasdf $didPop');
              if (didPop) {
                return;
              }
              final NavigatorState navigator = Navigator.of(context);
              final bool? shouldPop = await CustomDialog.show(
                context,
                WarningDialog(
                  title: "Are you sure Close?",
                  content: "This will remove close the application",
                  confirmText: "Close",
                  onConfirm: () {
                    Navigator.pop(context, true);
                  },
                  onCancel: () {
                    Navigator.pop(context, false);
                  },
                ),
              );
              if (shouldPop ?? false) {
                SystemNavigator.pop();
              }
              // if (await _controller.canGoBack()) {
              //   await _controller.goBack();
              // } else {
              //   return true;
              // }
              // return false;
            },
            child: WebViewWidget(
              controller: _controller,
            ),
          ),
          if (_loadingPercentage < 100)
            LinearProgressIndicator(
              value: _loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
