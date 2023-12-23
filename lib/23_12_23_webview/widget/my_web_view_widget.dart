import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
              logger.info('current isExit $isExit');
              // final diffrence = DateTime.now().difference(timeback)
              // var _isExitWarning = 0;
              // if(_isExitWarning)
              // if (didPop) {
              //   logger.info('didPop $didPop');
              //   return;
              // }
              if (await _controller.canGoBack()) {
                await _controller.goBack();
                logger.info('didPop aysnc $didPop goBack');
                isExit = 0;
                return;
                // } else if (await _controller.canGoForward()) {
                //   await _controller.goForward();
                //   logger.info('goForward');
                //   return;
                // } else {
                //   logger.info('didPop aysnc $didPop none');
                //   return;
              } else {
                logger.info('flutter toast');
                Fluttertoast.showToast(
                  msg: "Press again to exit",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                isExit++;
                logger.info('flutter toast $isExit');
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
