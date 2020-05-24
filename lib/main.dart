import 'package:beslen/meyvearasayfa.dart';
import 'package:beslen/sebzearasayfa.dart';
import 'package:beslen/vitaminarasayfa.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Mervemervmerve
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sağlıklı Beslen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sağlıklı Beslen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc30000),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 45.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                 Icon(Icons.local_dining,
                 size: 35.0,
                 color: Color(0xFFffb9a0) ,),
                Text('Sağlıklı',
                    style: GoogleFonts.pacifico(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .10),
                        fontSize: 26.0)),
                SizedBox(width: 10.0),
                Text('Beslen',
                    style: GoogleFonts.pacifico(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .10),
                        fontSize: 26.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('icons/hh.jpg'),
                fit: BoxFit.cover,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0),bottomRight: Radius.circular(60.0) ),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 250.0,
                        child: ListView(children: [
                          _buildFoodItem('icons/grape.png', 'MEYVELER        '),
                          _buildFoodItem1(
                              'icons/carrot.png', 'SEBZELER         '),
                          _buildFoodItem2('icons/hap.png', 'VİTAMİNLER      '),
                        ]))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName) {
    return Padding(
        padding:
            EdgeInsets.only(left: 60.0, right: 10.0, top: 20.0, bottom: 20.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Arasayfa(heroTag: Null, foodName: Null)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xFFf05545), Color(0xFFc30000)]),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Row(children: [
                      SizedBox(width: 10.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(foodName,
                                style: GoogleFonts.elMessiri(
                        textStyle:
                            TextStyle(color: Colors.white),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
                          ]),
                      Hero(
                          tag: imgPath,
                          child: Image(
                              image: AssetImage(imgPath),
                              fit: BoxFit.cover,
                              height: 65.0,
                              width: 65.0)),
                    ])),
              ],
            )));
  }

  Widget _buildFoodItem1(String imgPath, String foodName) {
    return Padding(
        padding:
            EdgeInsets.only(left: 60.0, right: 10.0, top: 20.0, bottom: 20.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      SArasayfa(heroTag: Null, foodName: Null)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xFFf05545), Color(0xFFc30000)]),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Row(children: [
                      SizedBox(width: 10.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(foodName,
                                style: GoogleFonts.elMessiri(
                        textStyle:
                            TextStyle(color: Colors.white),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
                          ]),
                      Hero(
                          tag: imgPath,
                          child: Image(
                              image: AssetImage(imgPath),
                              fit: BoxFit.cover,
                              height: 65.0,
                              width: 65.0)),
                    ])),
              ],
            )));
  }

  Widget _buildFoodItem2(String imgPath, String foodName) {
    return Padding(
        padding:
            EdgeInsets.only(left: 60.0, right: 10.0, top: 20.0, bottom: 20.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      VArasayfa(heroTag: Null, foodName: Null)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xFFf05545), Color(0xFFc30000)]),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Row(children: [
                      SizedBox(width: 10.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(foodName,
                                style: GoogleFonts.elMessiri(
                        textStyle:
                            TextStyle(color: Colors.white),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
                          ]),
                      Hero(
                          tag: imgPath,
                          child: Image(
                              image: AssetImage(imgPath),
                              fit: BoxFit.cover,
                              height: 65.0,
                              width: 65.0)),
                    ])),
              ],
            )));
  }
}
