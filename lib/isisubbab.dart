import 'dart:async';

import 'package:app_background/home.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'home.dart';
// import 'package:flutter/rendering.dart';

class IsiSubbab extends StatefulWidget {
  List list;
  final String translate;
  final String suara;
  final String subbab;

  IsiSubbab({this.translate, this.suara, this.subbab});
  @override
  _IsiSubbabState createState() => new _IsiSubbabState();
}

int status = 0;
AudioPlayer player = AudioPlayer();

class _IsiSubbabState extends State<IsiSubbab>
    with SingleTickerProviderStateMixin {
  // AudioPlayer advancedPlayer;

  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  String localFilePath;

  AudioPlayer player = AudioPlayer(); //add this
  AudioCache cache = new AudioCache(); //and this

  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration:
          Duration(seconds: 1), // how long should the animation take to finish
    );
    super.initState();
  }

  //set url and filename
  // final String urlExample =
  //     "http://ia802609.us.archive.org/13/items/quraninindonesia/001AlFaatihah.mp3";
  // final String nameExample = "Al-Fatihah";

  // Future<bool> _willPopCallback() async {
  //   player = await cache.loop('assets/yourMusicFileHere');
  //   return true;
  // }

  // @override
  // initState() {
  //    super.initState();

  //   if (kIsWeb) {
  //     // Calls to Platform.isIOS fails on web
  //     return;
  //   }
  //   if (Platform.isIOS) {
  //     if (audioCache.fixedPlayer != null) {
  //       audioCache.fixedPlayer.startHeadlessService();
  //     }
  //     advancedPlayer.startHeadlessService();
  //   loadMusic();
  // }

  Future loadMusic() async {
    advancedPlayer = await AudioCache()
        .loop("http://learnenglishapp.xyz/audio/" + widget.suara);
  }

  @override
  void dispose() {
    advancedPlayer = null;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Translate"),
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
                  Image.network(
                    'http://learnenglishapp.xyz/img/' + widget.subbab,
                    width: 180.0,
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // padding: EdgeInsets.fromLTRB(90.0, 0.0, 0.0, 0.0),
                  // padding: EdgeInsets.fromLTRB(100.0, 15.0, 30.0, 20.0),

                  Text(widget.translate),
                  SizedBox(
                    height: 10,
                  ),
                  // padding: EdgeInsets.fromLTRB(120.0, 15.0, 30.0, 20.0),
                  FloatingActionButton(
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _controller,
                      // color: Colors.blue,
                    ),
                    elevation: 15,
                    backgroundColor: Colors.deepPurple,
                    onPressed: () async {
                      if (status == 1) {
                        status = await player.stop();
                        _controller.reverse();
                        status = 0;
                      } else {
                        final String filePath =
                            "http://learnenglishapp.xyz/audio/" + widget.suara;
                        status = await player.play(filePath);
                        _controller.forward();
                        // player = await cache.play(
                        //     'http://learnenglishapp.xyz/audio/1609073386.mp3');

                        //also can be played from the assets...
                        //but users must have choices so local file is used!!
                      }
                    },
                  )
                ],
              ))),
    );
  }
}
