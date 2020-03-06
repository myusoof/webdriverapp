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
    return Scaffold(body: getListTile(context));
  }
  Widget getListTile(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
              [
                Image(image: AssetImage('assets/images/avatarimage.jpg'),height: 500,width: double.infinity,),
              ]
          ),
        ),
        SliverFillRemaining(
            child:WebView(
                initialUrl: 'about:blank',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) async {
                  _controller = webViewController;
                  await loadHtmlFromAssets('assets/webdriver.html', _controller);
                }
            )
        )
      ]
      ),
    );
  }

  Future<void> loadHtmlFromAssets(String filename, controller) async {
    String fileText = await rootBundle.loadString(filename);
    controller.loadUrl(Uri.dataFromString(fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
  }
}