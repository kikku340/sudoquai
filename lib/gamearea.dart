import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';
import './config/size_config.dart';

Widget gamearea() {
  int sum;
  return Scaffold(
      body: Center(
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "aaa",
          style: TextStyle(fontSize: 40),
        ),
      ),
      sudokucontainer(),
    ]),
  ));
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
                border: Border.all(color: Colors.green),
                //borderRadius: BorderRadius.circular(10),
              ),
              child: Table(
                  border: TableBorder.all(color: Colors.white),
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
                              child: TextButton(
                                child: Text(sprintf(
                                    "%i,%i", [3 * row + j, 3 * column + i])),
                                onPressed: () => print('クリックされました'),
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

Widget square(int row, int column, double side) {
  double sqare_side = side / 9;
  double align_row = side / (row + 1);
  double align_column = side / (column + 1);
  return Align(
    alignment: Alignment((2 / 8) * column - 1, (2 / 8) * row - 1),
    child: Container(
        width: sqare_side,
        height: sqare_side,
        color: Colors.black12,
        child: RaisedButton(
          onPressed: () {
            //updateField(currentPlayer, 0, 0);
          },
          child: Text(sprintf("%i", [(row + 1) * (column + 1)])),
          shape: Border(
            top: BorderSide(color: Colors.black, width: 2),
            left: BorderSide(color: Colors.black, width: 2),
            right: BorderSide(color: Colors.black, width: 2),
            bottom: BorderSide(color: Colors.black, width: 2),
          ),
          //field[0][0],
          //style: TextStyle(fontSize: 50),
        )),
  );
}
