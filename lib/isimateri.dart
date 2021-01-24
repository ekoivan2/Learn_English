import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_background/chewie_list_item.dart';
import 'package:video_player/video_player.dart';
import 'isisubbab.dart';

class IsiMateri extends StatefulWidget {
  List list;
  final String id_bab;
  final String animasi;
  int index;
  // final VideoPlayerController videoPlayerController;
  // final bool looping;

  IsiMateri(
      {
      //   @required this.videoPlayerController,
      // this.looping,
      // Key key,
      this.index,
      this.list,
      this.id_bab,
      this.animasi});
  // : super(key: key);
  @override
  _IsiMateriState createState() => new _IsiMateriState();
}

class _IsiMateriState extends State<IsiMateri> {
  // final videoPlayerController = VideoPlayerController.network(
  //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

  // ChewieController _chewieController;

  // VideoPlayerController _controller;
  // Future<void> _initializeVideoPlayerFuture;

  Future<List> getData() async {
    final response =
        await http.get("http://learnenglishapp.xyz/api/materisubbab/" +
            // widget.id_bab.toString());
            widget.id_bab);
    return json.decode(response.body);
  }

  // @override
  // void initState() {
  //   // super.initState;
  //   // _controller = VideoPlayerController.network(
  //   //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  //   // );
  //   // Wrapper on top of the videoPlayerController
  //   //   _chewieController = ChewieController(
  //   //   videoPlayerController: widget.videoPlayerController,
  //   //   aspectRatio: 16 / 9,
  //   //   // Prepare the video to be played and display the first frame
  //   //   autoInitialize: true,
  //   //   looping: widget.looping,
  //   //   autoPlay: true,
  //   //   // looping: true,
  //   //   // Errors can occur for example when trying to play a video
  //   //   // from a non-existent URL
  //   //   errorBuilder: (context, errorMessage) {
  //   //     return Center(
  //   //       child: Text(
  //   //         errorMessage,
  //   //         style: TextStyle(color: Colors.white),
  //   //       ),
  //   //     );
  //   //   },
  //   // );
  //   // final playerWidget = Chewie(
  //   //   controller: _chewieController,
  //   // );
  //   // _initializeVideoPlayerFuture = _controller.initialize();
  //   // super.initState();
  // }

  // @override
  // void dispose() {
  //   // Ensure disposing of the VideoPlayerController to free up resources.
  //   // _controller.dispose();

  //   widget.videoPlayerController.dispose();
  //   _chewieController.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Materi"),
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
          body: new Column(
            children: <Widget>[
              Container(
                height: 250,
                child: ChewieListItem(
                  // url video 2
                  videoPlayerController: VideoPlayerController.network(
                    'http://learnenglishapp.xyz/video/' + widget.animasi,
                  ),
                  // videoPlayerController: VideoPlayerController.network(
                  //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                  // ),
                ),
                // FutureBuilder(
                //   future: _initializeVideoPlayerFuture,
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.done) {
                //       // If the VideoPlayerController has finished initialization, use
                //       // the data it provides to limit the aspect ratio of the VideoPlayer.
                //       return AspectRatio(
                //         aspectRatio: _controller.value.aspectRatio,
                //         // Use the VideoPlayer widget to display the video.
                //         child: VideoPlayer(_controller),
                //       );
                //     } else {
                //       // If the VideoPlayerController is still initializing, show a
                //       // loading spinner.
                //       return Center(child: CircularProgressIndicator());
                //     }
                //   },
                // )
              ),
              // FloatingActionButton(
              //   onPressed: () {
              //     // Wrap the play or pause in a call to `setState`. This ensures the
              //     // correct icon is shown
              //     setState(() {
              //       // If the video is playing, pause it.
              //       if (_controller.value.isPlaying) {
              //         print(_controller);
              //         _controller.pause();
              //       } else {
              //         // If the video is paused, play it.
              //         _controller.play();
              //       }
              //     });
              //   },
              //   // Display the correct icon depending on the state of the player.
              //   child: Icon(
              //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              //   ),
              // ),
              Container(
                height: 350,
                child: FutureBuilder<List>(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                        ? new ItemList(
                            list: snapshot.data,
                          )
                        : new Center(
                            child: new CircularProgressIndicator(),
                          );
                  },
                ),
              )
            ],
          )),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  // final int id_bab;
  ItemList({this.list
      // , this.id_bab
      });

  Widget build(BuildContext context) {
    return new GridView.count(
        crossAxisCount: 2,
        children: List.generate(list == null ? 0 : list.length, (index) {
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new IsiSubbab(
                        translate: list[index]['translate'],
                        subbab: list[index]['subbab'],
                        suara: list[index]['suara'],
                      ))),
              child: new Card(
                elevation: 15,
                shadowColor: Color.fromARGB(150, 0, 0, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: new ListTile(
                  title: new Image.network("http://learnenglishapp.xyz/img/" +
                      list[index]['subbab']),
                  // leading: new Icon(Icons.widgets),
                ),
              ),
            ),
          );
        })
        // ListView.builder(
        //   itemCount: list == null ? 0 : list.length,
        //   itemBuilder: (BuildContext context, index) {
        //     return new Container(
        //       padding: const EdgeInsets.all(10.0),
        //       child: new GestureDetector(
        //         onTap: () => Navigator.of(context).push(new MaterialPageRoute(
        //             builder: (BuildContext context) =>
        //                 new IsiMateri(list: list, index: index))),
        //         child: new Card(
        //           child: new ListTile(
        //             title: new Image.network(
        //                 "http://10.0.2.2:8000/img/" + list[index]['subbab']),
        //             leading: new Icon(Icons.widgets),
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // )
        );
  }
}
