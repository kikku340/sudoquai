//import 'dart:html';

import 'package:flutter/cupertino.dart';

class sudoku {
  static List<List<int>> currentnumbers =
      List.generate(9, (_) => List.generate(9, (_) => -1));

  static void initial() {
    currentnumbers[0][0] = 9;
    currentnumbers[0][2] = 1;
    currentnumbers[0][1] = 5;
    currentnumbers[0][5] = 4;
    currentnumbers[1][3] = 2;
    currentnumbers[1][7] = 7;
    currentnumbers[2][1] = 8;
    currentnumbers[3][0] = 4;
    currentnumbers[3][2] = 6;
    currentnumbers[3][5] = 9;
    currentnumbers[3][6] = 1;
    currentnumbers[4][0] = 3;
    currentnumbers[5][4] = 5;
    currentnumbers[5][8] = 9;
    currentnumbers[6][0] = 6;
    currentnumbers[6][2] = 8;
    currentnumbers[6][4] = 7;
    currentnumbers[6][7] = 4;
    currentnumbers[7][1] = 2;
    currentnumbers[7][6] = 8;
    currentnumbers[8][1] = 3;
    currentnumbers[8][5] = 6;
  }

  /*public functions*/
  static bool chechvalidinputnumber(int column, int row) {
    return !_row_isvalid(column, row) |
        !_column_isvalid(column, row) |
        !_box_isvalid(column, row);
  }

  static bool check_complete(int column, int row) {
    return !_empty_check() |
        _row_isvalid(column, row) |
        _column_isvalid(column, row) |
        _box_isvalid(column, row);
  }
  /*private functions*/

  //空白(-1)がある場合true, ない場合falseを返す
  static bool _empty_check() {
    return currentnumbers.where((element) => element == -1).isEmpty;
  }

  static bool _row_isvalid(int column, int row) {
    List<int> tmp = List.generate(9, (_) => -1);
    for (int i = 0; i < 9; i++) {
      if (i == row) continue;
      tmp[i] = currentnumbers[column][i];
    }
    return tmp
        .where((element) => element == currentnumbers[column][row])
        .isEmpty;
  }

  static bool _column_isvalid(int column, int row) {
    List<int> tmp = List.generate(9, (_) => -1);
    for (int i = 0; i < 9; i++) {
      if (i == column) continue;
      tmp[i] = currentnumbers[i][row];
    }

    return tmp
        .where((element) => element == currentnumbers[column][row])
        .isEmpty;
  }

  static bool _box_isvalid(int column, int row) {
    final tmp = <int>[];
    int startI = 6;
    int startJ = 6;
    if (row < 3)
      startJ = 0;
    else if (row < 6) startJ = 3;

    if (column < 3)
      startI = 0;
    else if (column < 6) startI = 3;

    for (int i = startI; i < startI + 3; i++) {
      for (int j = startJ; j < startJ + 3; j++) {
        if (i == column && j == row || currentnumbers[i][j] == -1) continue;
        if (currentnumbers[column][row] == currentnumbers[i][j]) {
          return false;
        }
      }
    }
    return true;
  }
}
