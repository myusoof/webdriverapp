import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      radius: 30.0,
                      backgroundImage: AssetImage('images/selenium.png')
                  ),
                ],
              ),
              Text("Mohmed Yusoof",
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2
                ),),
              Text("Automation Engineer",
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DancingScript',
                    letterSpacing: 2.5
                ),),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.teal,
                  thickness: 1,
                ),
              ),
              Container(
                child: Card(
                  color: Colors.white,
//                    padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: ListTile(
                    leading: Icon(Icons.phone,
                      size: 50,
                      color: Colors.teal,),
                    title: Text(
                      "+91 7358361170",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              Card(
//                  padding: EdgeInsets.all(10), color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: ListTile(
                    leading:  Icon(Icons.email
                      ,size: 50.0,
                      color: Colors.teal,),
                    title: Text("yusoof1984@gmail.com",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontStyle: FontStyle.italic
                      ),) ,
                  )
              ),
              Container(width: double.infinity,)
            ],
          ),
        )
    );
  }
}
