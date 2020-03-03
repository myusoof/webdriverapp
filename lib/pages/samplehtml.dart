import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SampleHtml extends StatefulWidget {

  SampleHtml({Key key}) : super(key: key);

  @override
  _SampleHtmlState createState() => _SampleHtmlState();
}

class _SampleHtmlState extends State<SampleHtml> {
  WebViewController _controller;

  Future<String> _getFile() async {
    return await rootBundle.loadString('assets/webdriver.html');
  }
  Future<String> loadHtmlFromAssets(String filename) async {
    String fileText = await rootBundle.loadString(filename);
    await Uri.dataFromString(fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getFile(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WebviewScaffold(
            withJavascript: true,
            appCacheEnabled: true,
            withLocalUrl: true,
            hidden: true,
            allowFileURLs: true,
            url: new Uri.dataFromString(snapshot.data, mimeType: 'text/html').toString(),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
//    return Scaffold(
//      body: Builder(builder: (BuildContext context) {
//        return WebView(
//          initialUrl: 'about:blank',
//          javascriptMode: JavascriptMode.unrestricted,
//          onWebViewCreated: (WebViewController webViewController) async {
//            _controller = webViewController;
//            await loadHtmlFromAssets('assets/webdriver.html', _controller);
//          },
//        );
//      }),
//    );
 // }

}