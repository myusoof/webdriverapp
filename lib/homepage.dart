import 'package:flutter/material.dart';

import 'commonwidgets/DrawerItem.dart';
import 'commonwidgets/constants.dart';
import 'pages/aboutme.dart';
import 'pages/SecondFragment.dart';
import 'pages/ThirdFragment.dart';

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("About Me", Icons.rss_feed),
    new DrawerItem("Installation", Icons.local_pizza),
    new DrawerItem("Webdriver", Icons.info)
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
      case 0:
        return new AboutMe();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();

      default:
        return new Text("Error");
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
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
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