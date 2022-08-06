//import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyApp> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('GridView demo'),
      ),
      body: Container(
        child: _gamearea(),
      ),
    );
  }

  Widget _gamearea() {
    int sum;
    return Container(
      child: Row(children: <Widget>[
        for (int i = 1; i < 10; i++) ...{
          Expanded(
            child: Column(children: [
              for (int j = 1; j < 10; j++) ...{
                Text((i * j).toString()),
              }
            ]),
          )
        }
      ]),
    );
  }

  Widget _generator(int index) {
    return GestureDetector(
      child: GridTile(
        child: Container(
          color: Colors.grey,
          child: Center(
            child: Text(
              '${index + 1}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
      onDoubleTap: () {
        final snackBar = SnackBar(
          content: const Text('Yay! A SnackBar!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
