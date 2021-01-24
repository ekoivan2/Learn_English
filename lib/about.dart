import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false; // Set to true for visual layout
  runApp(About());
}

class About extends StatelessWidget {
  static final showCard = true; // Set to false to show Stack

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('About'),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                //  color: Colors.black
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.home, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              // new IconButton(icon: new Icon(Icons.search, color: Colors.white)),
            ],
          ),
          body: new Container(

              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center, padding: EdgeInsets.all(5.0),
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("images/Background.jpg"),
              //         fit: BoxFit.cover)
              //         ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    child: Column(
                      children: [
                        Stack(
                          alignment: const Alignment(0.6, 0.6),
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('images/ivan.JPG'),
                              radius: 100,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black45,
                              ),
                              child: Text(
                                'Ivan Eko',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ListTile(
                          title: Text('Ngimbang',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          subtitle: Text('Lamongan, Jawa Timur'),
                          leading: Icon(
                            Icons.home,
                            color: Colors.blue[500],
                          ),
                        ),
                        Divider(),
                        ListTile(
                          title: Text('+62852-3203-3790',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          leading: Icon(
                            Icons.contact_phone,
                            color: Colors.blue[500],
                          ),
                        ),
                        Divider(),
                        ListTile(
                          title: Text('ekoivan2@gmail.com'),
                          leading: Icon(
                            Icons.contact_mail,
                            color: Colors.blue[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("~Learn English~"),
                  // Image.network(
                  //   'http://learnenglishapp.xyz/img/' + widget.subbab,
                  //   width: 180.0,
                  //   height: 180.0,
                  //   fit: BoxFit.cover,
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  // padding: EdgeInsets.fromLTRB(90.0, 0.0, 0.0, 0.0),
                  // padding: EdgeInsets.fromLTRB(100.0, 15.0, 30.0, 20.0),

                  // Text("widget.translate"),
                  SizedBox(
                    height: 10,
                  ),
                  // padding: EdgeInsets.fromLTRB(120.0, 15.0, 30.0, 20.0),
                  // FloatingActionButton(
                  //   child: Icon(Icons.audiotrack),
                  //   elevation: 15,
                  //   backgroundColor: Colors.deepPurple,
                  //   onPressed: () async {
                  //     if (status == 1) {
                  //       status = await player.stop();
                  //       status = 0;
                  //     } else {
                  //       final String filePath =
                  //           "http://learnenglishapp.xyz/audio/" + widget.suara;
                  //       status = await player.play(filePath);
                  //       // player = await cache.play(
                  //       //     'http://learnenglishapp.xyz/audio/1609073386.mp3');

                  //       //also can be played from the assets...
                  //       //but users must have choices so local file is used!!
                  //     }
                  //   },
                  // )
                ],
              ))),
    );
  }

  // #docregion Card
  Widget _buildCard() => SizedBox(
        height: 210,
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text('1625 Main Street',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Text('My City, CA 99984'),
                leading: Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
              Divider(),
              ListTile(
                title: Text('(408) 555-1212',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                leading: Icon(
                  Icons.contact_phone,
                  color: Colors.blue[500],
                ),
              ),
              ListTile(
                title: Text('costa@example.com'),
                leading: Icon(
                  Icons.contact_mail,
                  color: Colors.blue[500],
                ),
              ),
            ],
          ),
        ),
      );
  // #enddocregion Card

  // #docregion Stack
  Widget _buildStack() => Stack(
        alignment: const Alignment(0.6, 0.6),
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/pic.jpg'),
            radius: 100,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'Mia B',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
  // #enddocregion Stack
}
