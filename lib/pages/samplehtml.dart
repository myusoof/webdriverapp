import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class SampleHtml extends StatefulWidget {
  @override
  _SampleHtmlState createState() => _SampleHtmlState();
}

class _SampleHtmlState extends State<SampleHtml> {
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Scaffold(
            body: HtmlWidget(
              """
<h1>Heading</h1>
<p>A paragraph with <strong>strong</strong> <em>emphasized</em> text.</p>
<ol>
  <li>List item number one</li>
  <li>
    Two
    <ul>
      <li>2.1 (nested)</li>
      <li>2.2</li>
    </ul>
  </li>
  <li>Three</li>
</ol>
<p>And YouTube video!</p>
<iframe src="https://www.youtube.com/embed/jNQXAC9IVRw" width="560" height="315"></iframe>
""",
              webView: true,
            ),
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
