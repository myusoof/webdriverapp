import 'package:flutter/material.dart';
import 'package:wediver_app_2/pages/samplehtml.dart';

import 'commonwidgets/DrawerItem.dart';
import 'commonwidgets/constants.dart';
import 'pages/aboutme.dart';
import 'pages/SecondFragment.dart';
import 'pages/ThirdFragment.dart';

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Webdriver"),
    new DrawerItem("Installation"),
    new DrawerItem("Element Identification"),
    new DrawerItem("Samples"),
    new DrawerItem("Build Tool"),
    new DrawerItem("BDD Cucumber"),
    new DrawerItem("Automation Framework"),
    new DrawerItem("Page Object Model"),
    new DrawerItem("About Me"),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}


class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0 :
        return SampleHtml();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();
      case 8:
        return new AboutMe();
      default:
        return Center(child: new Text("Under Implementation!!!", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),));
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    drawerOptions.add(
        Container(
      height: 70,
      child:  DrawerHeader(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text('Welcome', style: txtStyle_drawer_header,)),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.amber,
        ),
      ),
    ));
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            trailing: Icon(Icons.arrow_right),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.drawerItems[_selectedDrawerIndex].title),
            ],
          ),
        ),
        drawer: Container(
          width: 200,
          child: Drawer(
            child: Center(
              child: ListView(
                padding: EdgeInsets.zero,
                children: drawerOptions,
              ),
            ),
          ),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
    );
  }
}