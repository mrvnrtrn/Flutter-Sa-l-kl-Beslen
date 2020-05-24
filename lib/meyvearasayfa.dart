import 'package:beslen/Pagefruit.dart';
import 'package:beslen/main.dart';
import 'package:beslen/searchservice.dart';
import 'package:beslen/sebzearasayfa.dart';
import 'package:beslen/todolist.dart';
import 'package:beslen/vitaminarasayfa.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Arasayfa extends StatefulWidget {
  final heroTag;
  final foodName;
  final faydaTag;
  final gramTag;
  final kaloriTag;
  final vitaminTag;
  
  Arasayfa({Key key,this.heroTag, this.foodName, this.faydaTag, this.gramTag, this.kaloriTag, 
  this.vitaminTag}) : super(key: key);

  @override
  _ArasayfaState createState() => _ArasayfaState();
}

class _ArasayfaState extends State<Arasayfa> {
  final DocumentReference = Firestore.instance.document("Yeni");
  List<Widget> _pages;
  Widget _page1;
  Widget _page2;
  Widget _page3;

  int _currentIndex;
  Widget _currentPage;

  @override
  void initState() {
    super.initState();

    _page1 = Arasayfa();
    _page2 = SArasayfa();
    _page3 = VArasayfa();
  }

  int _selectedIndex = 0;
  int arama = 0;
  int aramaac = 0;
  void changeTab(int index) {
    setState(() {
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _page2),
        );
      }
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _page3),
        );
      }
    });
  }

  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchServiceMeyve().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['meyve'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => todolist()));
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFf05545),
        ),
        backgroundColor: Color(0xFFc30000),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          backgroundColor: Color(0xFFc30000),
          opacity: .2,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          fabLocation: BubbleBottomBarFabLocation.end, //new
          hasNotch: true, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor: Colors.black12,
          onTap: (index) => changeTab(index),
          currentIndex:
              _selectedIndex, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: Colors.white,
              icon: Image.asset('icons/fruit.png'),
              title: Text("Meyveler",
              style: GoogleFonts.nanumPenScript(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .10),
                            fontSize: 18.0),),
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.white,
                icon: Image.asset('icons/vegetable.png'),
                title: Text("Sebzeler",
              style: GoogleFonts.nanumPenScript(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .10),
                            fontSize: 20.0),),),
            BubbleBottomBarItem(
                backgroundColor: Colors.white,
                icon: Image.asset('icons/vitamins.png'),
                title: Text("Vitaminler",
              style: GoogleFonts.nanumPenScript(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .10),
                            fontSize: 20.0),),),
          ],
        ),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(75.0),
                bottomRight: Radius.circular(75.0),
                topLeft: Radius.circular(75.0),
                topRight: Radius.circular(75.0)),
          ),
          backgroundColor: Color(0xFFc30000),
          centerTitle: true,
          title: Text('Sağlıklı Beslen',
           style: GoogleFonts.pacifico(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .10)),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyApp()),);
            },
          ),
          actions: <Widget>[
            new IconButton(
                color: Colors.white,
                icon: Icon(Icons.search),
                iconSize: 25.0,
                onPressed: _searchOpen),
            new IconButton(
                color: Colors.white,
                icon: Icon(Icons.highlight_off),
                iconSize: 25.0,
                onPressed: _searchClose),
          ],
        ),
        body: ListView(children: <Widget>[
          SizedBox(height: 0.0),
          Container(
              height: MediaQuery.of(context).size.height - 145.0,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('icons/abck.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(75.0),
                      bottomRight: Radius.circular(75.0),
                      topLeft: Radius.circular(75.0),
                      topRight: Radius.circular(75.0))),
              child: SafeArea(
                  child: SingleChildScrollView(
                      child: StreamBuilder(
                          stream:
                              Firestore.instance.collection('Yeni').snapshots(),
                          builder: (context, snapshots) {
                            if (!snapshots.hasData) return Text(" ");
                            //print(meyveliste);
                            if (arama == 1) {
                              return Column(children: <Widget>[
                                SizedBox(height: 10.0),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, top: 10),
                                  child: TextField(
                                    onChanged: (val) {
                                      initiateSearch(val);
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: IconButton(
                                        color: Colors.black,
                                        icon: Icon(Icons.search),
                                        iconSize: 20.0,
                                        onPressed: () {},
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(left: 25.0),
                                      hintText: 'Meyve Ara',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                  ),
                                ),
                                Column(
                                    children: tempSearchStore
                                        .map((doc) => _buildFoodItem(
                                                (doc["icon"]),
                                                (doc["meyve"]),
                                                (doc["faydaları"]),
                                                (doc["gram"]),
                                                (doc["kalori"]),
                                                (doc["vitamin"]),
                                            ))
                                        .toList()),
                              ]);
                            }
                            if (arama == 0) {
                              return new Container(
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: Firestore.instance
                                      .collection("Yeni")
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text(' ');
                                    }

                                    return Column(
                                      children: snapshot.data.documents
                                          .map((doc) => _buildFoodItem(
                                                (doc["icon"]),
                                                (doc["meyve"]),
                                                (doc["faydaları"]),
                                                (doc["gram"]),
                                                (doc["kalori"]),
                                                (doc["vitamin"]),
                                              ))
                                          .toList(),
                                    );
                                  },
                                ),
                              );
                            }
                          }))))
        ]));
  }

  Widget _buildFoodItem(String imgPath, String foodName, String faydaName, String gramName, String kaloriName, String vitaminName) {
    return Padding(
        padding:
            EdgeInsets.only(left: 60.0, right: 10.0, top: 15.0, bottom: 20.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PageFruit(
                      heroTag: imgPath,
                      foodName: foodName,
                      faydaTag: faydaName,
                      gramTag: gramName,
                      kaloriTag: kaloriName,
                      vitaminTag: vitaminName)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xFFf05545), Color(0xFFc30000)]),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(75.0),
                          bottomRight: Radius.circular(75.0)),
                    ),
                    child: Row(children: [
                      Hero(
                          tag: imgPath,
                          child: Image(
                              image: AssetImage(imgPath),
                              fit: BoxFit.cover,
                              height: 65.0,
                              width: 65.0)),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 180.0),
                            Text(foodName,
                        style: GoogleFonts.marcellus(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .10),
                                    fontSize: 17.0,
                                    )),
                          ])
                    ])),
              ],
            )));
  }

  void _searchClose() {
    setState(() {
      arama = 0;
    });
  }

  void _searchOpen() {
    setState(() {
      arama = 1;
    });
  }
}
