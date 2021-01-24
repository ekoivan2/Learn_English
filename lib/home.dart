import 'package:app_background/about.dart';
import 'package:app_background/soal/kuis.dart';
import 'package:app_background/materi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// void main() {
//   runApp(Home());
// }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<bool> _onBackPressed(BuildContext context) {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Color.fromRGBO(11, 252, 204, 50),
                  child: Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Color.fromRGBO(11, 252, 204, 50),
                  child: Text("Yes"),
                  onPressed: () {
                    SystemNavigator.pop();
                  }),
            ],
          ),
        ) ??
        false;
  }

  Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      padding: EdgeInsets.all(5.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Learn English"),
          // backgroundColor: Color.fromRGBO(11, 252, 204, 1),
        ),
        body: Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/Background.jpg"),
                    fit: BoxFit.cover)),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/logo_bahasa_inggris.png",
                  width: 200.0,
                ),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Color.fromRGBO(11, 252, 204, 50),
                    child: Text("Materi"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Materi();
                      }));
                    }),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                    child: Text("Kuis"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Color.fromRGBO(11, 252, 204, 50),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Kuis();
                      }));
                    }),
                RaisedButton(
                    child: Text("About"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Color.fromRGBO(11, 252, 204, 50),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return About();
                      }));
                    }),
                RaisedButton(
                    child: Text("Exit"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Color.fromRGBO(11, 252, 204, 50),
                    onPressed: () {
                      _onBackPressed(context);
                    }),

                SizedBox(
                  height: 10,
                ),

                // RaisedButton(
                //     child: Text("video coba"),
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5)),
                //     color: Color.fromRGBO(11, 252, 204, 50),
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) {
                //         return videocoba();
                //       }));
                //     }),
              ],
            )),
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
}
