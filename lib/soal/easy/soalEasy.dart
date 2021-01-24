import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class soalEasy extends StatefulWidget {
  @override
  _soalEasyState createState() => _soalEasyState();
}

class _soalEasyState extends State<soalEasy> {
  int _radioValue1 = -1;
  int correctScore = 0;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;

  void _handleRadioValueChanged1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Correct !', toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Try Again !', toastLength: Toast.LENGTH_LONG);
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try Again !', toastLength: Toast.LENGTH_LONG);
          break;
      }
    });
  }

  void _handleRadioValueChanged2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Try Again !', toastLength: Toast.LENGTH_SHORT);

          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Correct', toastLength: Toast.LENGTH_LONG);
          correctScore++;
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try Again !', toastLength: Toast.LENGTH_LONG);
          break;
      }
    });
  }

  void _handleRadioValueChanged3(int value) {
    setState(() {
      _radioValue3 = value;

      switch (_radioValue3) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Try Again !', toastLength: Toast.LENGTH_SHORT);

          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Try Again !', toastLength: Toast.LENGTH_LONG);
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Correct !', toastLength: Toast.LENGTH_LONG);
          correctScore++;
          break;
      }
    });
  }

  void _handleRadioValueChanged4(int value) {
    setState(() {
      _radioValue4 = value;

      switch (_radioValue4) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Correct !', toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Try Again !', toastLength: Toast.LENGTH_LONG);
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try Again !', toastLength: Toast.LENGTH_LONG);
          break;
      }
    });
  }

  void _handleRadioValueChanged5(int value) {
    setState(() {
      _radioValue5 = value;

      switch (_radioValue5) {
        case 0:
          Fluttertoast.showToast(
              msg: 'Correct !', toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 1:
          Fluttertoast.showToast(
              msg: 'Correct !', toastLength: Toast.LENGTH_LONG);
          break;
        case 2:
          Fluttertoast.showToast(
              msg: 'Try Again !', toastLength: Toast.LENGTH_LONG);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Quiz Apps'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: new ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          new Text(
            'Silahkan Pilih Jawaban Yang benar dari soal dibawah ini :',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          new Padding(padding: new EdgeInsets.all(8.0)),
          new Divider(
            height: 5.0,
            color: Colors.purpleAccent,
          ),
          new Padding(padding: new EdgeInsets.all(8.0)),
          new Text(
            'Lion is ....',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio(
                value: 0,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChanged1,
              ),
              new Text('Carnivore',
                  style: TextStyle(
                    fontSize: 12.0,
                  )),
              new Radio(
                value: 1,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChanged1,
              ),
              new Text('Herbivore',
                  style: TextStyle(
                    fontSize: 12.0,
                  )),
              new Radio(
                value: 2,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChanged1,
              ),
              new Text('Omnivore',
                  style: TextStyle(
                    fontSize: 12.0,
                  )),
            ],
          ),
          new Divider(
            height: 5.0,
            color: Colors.purpleAccent,
          ),
          new Padding(padding: new EdgeInsets.all(8.0)),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Giraffe is :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: _radioValue2,
                    onChanged: _handleRadioValueChanged2,
                  ),
                  new Text('Carnivore',
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                  new Radio(
                    value: 1,
                    groupValue: _radioValue2,
                    onChanged: _handleRadioValueChanged2,
                  ),
                  new Text('Herbivore',
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                  new Radio(
                    value: 2,
                    groupValue: _radioValue2,
                    onChanged: _handleRadioValueChanged2,
                  ),
                  new Text('Omnivore',
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                ],
              ),
            ],
          ),
          new Divider(
            height: 5.0,
            color: Colors.purpleAccent,
          ),
          new Padding(padding: new EdgeInsets.all(8.0)),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Who is best rangers ? :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    'assets/Background.jpg',
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                  Image.asset(
                    'assets/Background.jpg',
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                  Image.asset(
                    'assets/Background.jpg',
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: _radioValue3,
                    onChanged: _handleRadioValueChanged3,
                  ),
                  new Text('Green',
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                  new Radio(
                    value: 1,
                    groupValue: _radioValue3,
                    onChanged: _handleRadioValueChanged3,
                  ),
                  new Text('Black',
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                  new Radio(
                    value: 2,
                    groupValue: _radioValue3,
                    onChanged: _handleRadioValueChanged3,
                  ),
                  new Text('Yellow',
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                ],
              )
            ],
          ),
          new Divider(
            height: 5.0,
            color: Colors.purpleAccent,
          ),
          new Padding(padding: new EdgeInsets.all(8.0)),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Bear is :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: _radioValue4,
                    onChanged: _handleRadioValueChanged4,
                  ),
                  new Text('Carnivore',
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                  new Radio(
                    value: 1,
                    groupValue: _radioValue4,
                    onChanged: _handleRadioValueChanged4,
                  ),
                  new Text('Herbivore',
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                  new Radio(
                    value: 2,
                    groupValue: _radioValue4,
                    onChanged: _handleRadioValueChanged4,
                  ),
                  new Text('Omnivore',
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                ],
              ),
            ],
          ),
          new Divider(
            height: 5.0,
            color: Colors.purpleAccent,
          ),
          new Padding(padding: new EdgeInsets.all(8.0)),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Elephant is :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: _radioValue5,
                    onChanged: _handleRadioValueChanged5,
                  ),
                  new Text('Carnivore',
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                  new Radio(
                    value: 1,
                    groupValue: _radioValue5,
                    onChanged: _handleRadioValueChanged5,
                  ),
                  new Text('Herbivore',
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                  new Radio(
                    value: 2,
                    groupValue: _radioValue5,
                    onChanged: _handleRadioValueChanged5,
                  ),
                  new Text('Omnivore',
                      style: TextStyle(
                        fontSize: 12.0,
                      )),
                ],
              ),
            ],
          ),
          new Divider(
            height: 5.0,
            color: Colors.purpleAccent,
          ),
          new Padding(
            padding: EdgeInsets.all(8.0),
          ),
          new RaisedButton(
            onPressed: () {
              validateAnswer();
            },
            child: Text(
              'Check Final Score',
              style: new TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
          new Padding(
            padding: EdgeInsets.all(4.0),
          ),
          new RaisedButton(
            onPressed: () {
              resetSelection();
            },
            child: Text(
              'Reset Selection',
              style: new TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          )
        ],
      ),
    );
  }

  void resetSelection() {
    _handleRadioValueChanged1(-1);
    _handleRadioValueChanged2(-1);
    _handleRadioValueChanged3(-1);
    _handleRadioValueChanged4(-1);
    _handleRadioValueChanged5(-1);
    correctScore = 0;
  }

  void validateAnswer() {
    if (_radioValue1 == -1 &&
        _radioValue2 == -1 &&
        _radioValue3 == -1 &&
        _radioValue4 == -1 &&
        _radioValue5 == -1) {
      Fluttertoast.showToast(
          msg: 'Please Select atleast one answer',
          toastLength: Toast.LENGTH_LONG);
    } else {
      Fluttertoast.showToast(
          msg: 'Your total score is : $correctScore out of 5',
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
