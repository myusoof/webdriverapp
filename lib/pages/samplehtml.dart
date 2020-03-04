import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class SampleHtml extends StatefulWidget {
  @override
  _SampleHtmlState createState() => _SampleHtmlState();
}

class _SampleHtmlState extends State<SampleHtml> {
  WebViewController _controller ;
  bool isLoaded;

  @override
  void initState() {
    super.initState();
    isLoaded=false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: WebView(
                  initialUrl: "file:///android_asset/flutter_assets/assets/webdriver.html",
                  onWebViewCreated: (WebViewController webViewController) async{
                    _controller = webViewController;
                    //await loadHtmlFromAssets('assets/webdriver.html', _controller);
//                _controller.loadUrl("https://www.iflutter.in/flutter-webview/");
                  },
                  onPageFinished: (value){
                    setState(() {
                      isLoaded=true;
                    });
                  },
                ),
              ),
            ),
            (isLoaded)?Container():Center(child: CircularProgressIndicator(),)
          ],
        );
         WebView(
          initialUrl: 'https://www.iflutter.in',
          javascriptMode: JavascriptMode.unrestricted,
        );
      }),
    );
  }

  Future<void> loadHtmlFromAssets(String filename, controller) async {
    String fileText = await rootBundle.loadString(filename);
    controller.loadUrl(Uri.dataFromString(fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
  }
}