import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class SampleHtml extends StatefulWidget {
  @override
  _SampleHtmlState createState() => _SampleHtmlState();
}

class _SampleHtmlState extends State<SampleHtml> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

//  @override
//  void initState() {
//    super.initState();
//    _controller.future.then((controller) {
//      _loadHtmlFromAssets(controller);
//    });
//  }

  Future<void> _loadHtmlFromAssets(WebViewController controller) async {
    String fileText = await rootBundle.loadString('assets/webdriver.html');
    String theURI = Uri.dataFromString(fileText,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
    controller.loadUrl(theURI);
//    setState(() {
//      print(theURI);
//      controller.loadUrl(theURI);
//    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
          child: getListTile(context) ,
        ));
  }

  Future<Widget> getWidget() => Future.delayed(Duration(seconds: 10), (){
    return WebView(
        initialUrl: "",
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        javascriptMode: JavascriptMode.unrestricted);
  });

  void understandingFuture(){

  }

  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 5),
        () => 'Data Loaded',
  );
  Widget futureHtml(){
    return FutureBuilder<String>(
      future: _calculation, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        List<Widget> children;

        if (snapshot.hasData) {
          children = <Widget>[
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Result: ${snapshot.data}'),
            )
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
  Widget getListTile(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
              [
                Image(image: AssetImage('assets/images/avatarimage.jpg'),height: 500,width: double.infinity,)
              ]
          ),
        ),
      ]
      ),
    );
  }

  Future<void> loadHtmlFromAssets(String filename, controller) async {
    String fileText = await rootBundle.loadString(filename);
    controller.loadUrl(Uri.dataFromString(fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
  }
}