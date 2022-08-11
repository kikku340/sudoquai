//import 'dart:html';
import './config/size_config.dart';
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
  int _selectedrow = 1;
  int _selectedcolumn = 1;

  List<List<Color>> currentcolors =
      List.generate(9, (_) => List.generate(9, (_) => Colors.white));
  List<List<String>> currentnumbers =
      List.generate(9, (_) => List.generate(9, (_) => ""));

  _State() {
    initializecolors();
  }

  void initializecolors() {
    currentcolors =
        List.generate(9, (_) => List.generate(9, (_) => Colors.white));
  }

  void updatearea(int row, int column) {
    _selectedcolumn = column;
    _selectedrow = row;
    setState(() {
      initializecolors();
      currentcolors[_selectedrow][_selectedcolumn] =
          Color.fromARGB(255, 188, 225, 255);
    });
  }

  void updatenumber(int num) {
    String inputstring;
    if (num == 99)
      inputstring = "";
    else
      inputstring = num.toString();
    setState(() {
      currentnumbers[_selectedrow][_selectedcolumn] = inputstring;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('GridView demo'),
      ),
      body: Container(
          child: Scaffold(
              body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "sudoku insanity",
              style: TextStyle(fontSize: 40),
            ),
          ),
          sudokucontainer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: numbercontainer(),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Colors.blueGrey),
            ),
            color: Colors.blue,
            child: Text(
              "Clear",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => updatenumber(99),
          )
        ]),
      ))),
    );
  }

  Widget numbercontainer() {
    double side = SizeConfig.blockSizeHorizontal! * 90;
    return Container(
        width: side,
        child: Table(
            border: TableBorder.all(color: Colors.white),
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(1.0),
              1: FlexColumnWidth(1.0),
              2: FlexColumnWidth(1.0),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            children: [
              for (int i = 0; i < 7; i += 3) ...{
                TableRow(children: [
                  for (int j = 1; j < 4; j++) ...{
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), //角の丸み
                        side: BorderSide(color: Colors.blueGrey), //枠//枠線の設定
                      ),
                      color: Colors.blue,
                      child: Text(
                        (i + j).toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => updatenumber(i + j),
                    ),
                  }
                ])
              }
            ]));
  }

  Widget sudokucontainer() {
    double side = SizeConfig.blockSizeHorizontal! * 90;
    return Container(
      color: Colors.blue.shade100,
      width: side,
      height: side,
      child: Stack(children: [
        for (int row = 0; row < 3; row++) ...{
          for (int column = 0; column < 3; column++) ...{
            Align(
              alignment: Alignment(row - 1, column - 1),
              child: Container(
                width: side / 3,
                height: side / 3,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  //borderRadius: BorderRadius.circular(10),
                ),
                child: Table(
                    border: TableBorder.all(color: Colors.black),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(1.0),
                      1: FlexColumnWidth(1.0),
                      2: FlexColumnWidth(1.0),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    children: [
                      for (int i = 0; i < 3; i++) ...{
                        TableRow(children: [
                          for (int j = 0; j < 3; j++) ...{
                            Align(
                              alignment: Alignment(i - 1, j - 1),
                              child: Container(
                                width: side / 9,
                                height: side / 9,
                                color: currentcolors[3 * row + j]
                                    [3 * column + i],
                                child: TextButton(
                                  child: Text(currentnumbers[3 * row + j]
                                      [3 * column + i]),
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black)),
                                  onPressed: () =>
                                      updatearea(3 * row + j, 3 * column + i),
                                ),
                              ),
                            )
                          }
                        ])
                      }
                    ]),
              ),
            )
          }
        }
      ]),
    );
  }
}
