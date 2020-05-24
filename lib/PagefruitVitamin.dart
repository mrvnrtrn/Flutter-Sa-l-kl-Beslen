import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageFruitVitamin extends StatefulWidget {
  final heroTag;
  final foodName;
  final faydaTag;

  PageFruitVitamin({this.heroTag, this.foodName, this.faydaTag});

  @override
  _PageFruitVitaminState createState() => _PageFruitVitaminState();
}

class _PageFruitVitaminState extends State<PageFruitVitamin> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFc30000),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Sağlıklı Beslen',
              style: GoogleFonts.pacifico(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .10),
                  fontSize: 20.0,)),
          centerTitle: true,
        ),
        body: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height - 20.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 75.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 20.0,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
                top: 20.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.heroTag),
                                fit: BoxFit.cover)),
                        height: 190.0,
                        width: 200.0))),
            Positioned(
                top: 210.0,
                left: 20.0,
                right: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.foodName,
                         style: GoogleFonts.nanumPenScript(
                        textStyle:
                            TextStyle(color: Colors.black, letterSpacing: .10),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold)),
                    Text(widget.faydaTag,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400)),
                  ],
                ))
          ])
        ]));
  }
}
