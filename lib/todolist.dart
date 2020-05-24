import 'package:beslen/main.dart';
import 'package:flutter/material.dart';
import 'package:beslen/dbhelper.dart';
import 'package:google_fonts/google_fonts.dart';

class todolist extends StatefulWidget {
  @override
  _todolistState createState() => _todolistState();
}

class _todolistState extends State<todolist> {
  final dbhelper = Databasehelper.instance;

  final texteditingcontroller = TextEditingController();
  bool validated = true;
  String errtext = "";
  String todoedited = "";
  var myitems = List();
  List<Widget> children = new List<Widget>();

  void addtodo() async {
    Map<String, dynamic> row = {
      Databasehelper.columnName: todoedited,
    };
    final id = await dbhelper.insert(row);
    print(id);
   Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => todolist()),);
    todoedited = "";
    setState(() {
      validated = true;
      errtext = "";
    });
  }

  Future<bool> query() async {
    myitems = [];
    children = [];
    var allrows = await dbhelper.queryall();
    allrows.forEach((row) {
      myitems.add(row.toString());
      children.add(Card(
        elevation: 5.0,
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(
              row['todo'],
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Raleway",
              ),
            ),
            leading: IconButton(
            icon: Icon(Icons.delete_forever),
            color: Colors.red,
            onPressed: () {
               dbhelper.deletedata(row['id']);
              setState(() {});
            }
          ),
             onLongPress: () {
             
            }, 
          ),
        ),
      ));
    });
    return Future.value(true);
  }

  void showalertdialog() {
    texteditingcontroller.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text(
                "Yapılacaklar",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: texteditingcontroller,
                    autofocus: true,
                    onChanged: (_val) {
                      todoedited = _val;
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Raleway",
                    ),
                    decoration: InputDecoration(
                      errorText: validated ? null : errtext,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            if (texteditingcontroller.text.isEmpty) {
                              setState(() {
                                errtext = "boş bırakmayınız";
                                validated = false;
                              });
                            } else if (texteditingcontroller.text.length >
                                512) {
                              setState(() {
                                errtext = "Çok uzun";
                                validated = false;
                              });
                            } else {
                              addtodo();
                            }
                          },
                          color: Color(0xFFc30000),
                          child: Text("Ekle",
                        style: GoogleFonts.girassol(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .10),
                                fontSize: 18.0,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

 @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.hasData == null) {
          return Center(
            child: Text(
              "Hiç bilgi yok",
            ),
          );
        } else {
          if (myitems.length == 0) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showalertdialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Color(0xFFf05545),
              ),
              appBar: AppBar(
                backgroundColor: Color(0xFFc30000),
                centerTitle: true,
                title: Text(
                  'Sağlıklı Beslen',
                  style: GoogleFonts.pacifico(
                      textStyle:
                          TextStyle(color: Colors.white, letterSpacing: .10)),
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyApp()));
                  },
                ),
              ),
              backgroundColor: Color(0xFFc30000),
              body: ListView(children: <Widget>[
                SizedBox(height: 0.0),
                Container(
                  height: MediaQuery.of(context).size.height - 145.0,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('icons/yaprak.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60.0),
                        bottomRight: Radius.circular(60.0),
                      )),
                      child: Center(
                         child: Text("YAPILACAKLAR LİSTESİ BOŞ",
                          style: GoogleFonts.girassol(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .10),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold)),
                      ),
                ),
              ]),
            );
          } else {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showalertdialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Color(0xFFf05545),
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
                title: Text(
                  'Sağlıklı Beslen',
                  style: GoogleFonts.pacifico(
                      textStyle:
                          TextStyle(color: Colors.white, letterSpacing: .10)),
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                    onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyApp()));
                  },
                ),
              ),
              backgroundColor: Color(0xFFc30000),
              body: SingleChildScrollView(
                child: Column(
                  children: children,
                ),
              ),
            );
          }
        }
      },
      future: query(),
    );
  }
}
