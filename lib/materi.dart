import 'dart:async';
import 'dart:convert';
import 'package:app_background/isimateri.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void main() {
//   runApp(Materi());
// }

class Materi extends StatefulWidget {
  @override
  _MateriState createState() => _MateriState();
}

class _MateriState extends State<Materi> {
  Future<List> getData() async {
    final response = await http.get("http://learnenglishapp.xyz/api/materi");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bab Materi"),
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
        body: new FutureBuilder<List>(
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
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (BuildContext context, index) {
        return new Container(
          padding: const EdgeInsets.all(5.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new IsiMateri(
                    list: list,
                    index: index,
                    id_bab: list[index]['id_bab'],
                    animasi: list[index]['animasi']))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[index]['bab']),
                leading: new Icon(Icons.widgets),
                //       onTap: () async {
                //         return Navigator.push(
                //           context, MaterialPageRoute(builder: (context) => IsiMateri()));
                // },
              ),
            ),
          ),
        );
      },
    );
  }
}
