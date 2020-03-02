import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class SampleHtml extends StatefulWidget {
  @override
  _SampleHtmlState createState() => _SampleHtmlState();
}

class _SampleHtmlState extends State<SampleHtml> {
  var _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    Future<String> loadAsset() async {
      return await rootBundle.loadString('assets/webdriver.html');
    }

    return Container(
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: <Widget>[
         FutureBuilder(
                future: loadAsset(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return HtmlWidget(snapshot.data, webView: true,);
                  }else{
                   return Dialog(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new CircularProgressIndicator(backgroundColor: Colors.green,),
                          new Text("Loading"),
                        ],
                      ),
                    );
                  }
                },
            ),
          Scaffold(
            body: Container(
              child: Center(child: Text("Page 2")),
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}