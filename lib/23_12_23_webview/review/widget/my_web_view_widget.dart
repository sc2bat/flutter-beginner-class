import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:webview_flutter/webview_flutter.dart';

final logger = SimpleLogger();

class MyWebViewWidget extends StatefulWidget {
  const MyWebViewWidget({super.key});

  @override
  State<MyWebViewWidget> createState() {
    return _MyWebViewWidget();
  }
}

class _MyWebViewWidget extends State<MyWebViewWidget> {
  late WebViewController _controller;
  final _url = 'https://flutter.dev';

  var _loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // javascript 필수 페이지
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _loadingPercentage = 0;
            });
            logger.info('onPageStarted _loadingPercentage $_loadingPercentage');
          },
          onProgress: (int progress) {
            setState(() {
              _loadingPercentage = progress;
            });
            logger.info('onProgress _loadingPercentage $_loadingPercentage');
          },
          onPageFinished: (String url) {
            setState(() {
              _loadingPercentage = 100;
            });
            logger
                .info('onPageFinished _loadingPercentage $_loadingPercentage');
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
    var isExit = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('webview review'),
        actions: [
          const IconButton(
            onPressed: _nullFunction,
            icon: Icon(
              Icons.add,
            ),
          ),
          PopupMenuButton<String>(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'https://www.google.com/',
                child: Text('google'),
              ),
              const PopupMenuItem(
                value: 'https://www.naver.com/',
                child: Text('naver'),
              ),
              const PopupMenuItem(
                value: 'https://www.kakaocorp.com/',
                child: Text('kakao'),
              ),
            ],
            onSelected: (value) {
              setState(() {
                _controller.loadRequest(
                  Uri.parse(value),
                );
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          PopScope(
            canPop: false,
            onPopInvoked: (didPop) async {
              logger.info('isExit $isExit');
              if (await _controller.canGoBack()) {
                await _controller.goBack();
                isExit = 0;
                return;
              } else {
                Fluttertoast.showToast(
                    msg: "Press again to exit",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                isExit++;
              }
              if (isExit > 2) SystemNavigator.pop();
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

void _nullFunction() {}
