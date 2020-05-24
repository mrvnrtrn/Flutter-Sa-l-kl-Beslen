import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageFruit extends StatefulWidget {
  final heroTag;
  final foodName;
  final faydaTag;
  final gramTag;
  final kaloriTag;
  final vitaminTag;

  PageFruit({this.heroTag, this.foodName, this.faydaTag, this.gramTag, this.kaloriTag, 
  this.vitaminTag});

  @override
  _PageFruitState createState() => _PageFruitState();
}

class _PageFruitState extends State<PageFruit> {
  var selectedCard = 'WEIGHT';
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
                  fontSize: 20.0,
                  )),
          centerTitle: true,
        ),
        body: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height - 30.0,
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
                    height: MediaQuery.of(context).size.height - 50.0,
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
                         style: GoogleFonts.marcellus(
                        textStyle:
                            TextStyle(color: Colors.black, letterSpacing: .10),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold)),
                      Text(widget.faydaTag,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400)),
                    SizedBox(height: 20.0),
                    Container(
                      height: 150.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildInfoCard('MİKTAR',widget.gramTag,select = 1),
                          SizedBox(width: 10.0),
                            _buildInfoCard('KALORİ', widget.kaloriTag,select = 2),
                            SizedBox(width: 10.0),
                            _buildInfoCard('VİTAMİN', widget.vitaminTag,select = 3),
                        ],
                      )
                    ),
                  ],
                ))
          ])
        ]));
  }

  Widget _buildInfoCard(String cardTitle, String unit, int renk) {
    return InkWell(
      onTap: () {
        selectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: select == 1  ? Color(0xFFf05545) : Color(0xFFff8871),
          border: Border.all(
            color: select == 1 || select == 2 || select == 3  ? 
            Colors.black :
            Colors.white.withOpacity(0.7),
            style: BorderStyle.solid,
          width: 0.75
          ),
          
        ),
        height: 100.0,
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(cardTitle,
                         style: GoogleFonts.marcellusSC(
                        textStyle:
                            TextStyle(color: cardTitle == selectedCard || select == 1? Colors.white : Colors.black.withOpacity(0.9),
                             letterSpacing: .10),
                    fontSize: 12.0,
                     fontWeight: FontWeight.bold
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(unit,
                         style: GoogleFonts.marcellusSC(
                        textStyle:
                            TextStyle(color: cardTitle == selectedCard || select == 1 ? Colors.white : Colors.black.withOpacity(0.9),
                             letterSpacing: .10),
                        fontSize: 12.0,
                      ))
                ],
              ),
            )
          ]
        )
      )
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}