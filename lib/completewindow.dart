import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CompletePage extends StatefulWidget {
  const CompletePage({Key? key}) : super(key: key);

  @override
  State<CompletePage> createState() => CompletePageState();
}

class CompletePageState extends State<CompletePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "クリアしました！",
            style: TextStyle(fontSize: 40),
          ),
        ),
        Image.network(
            'https://c.tenor.com/s9yLYzDwk78AAAAC/%E3%81%8A%E3%82%81%E3%81%A7%E3%81%A8%E3%81%86-%E5%AC%89%E3%81%97%E3%81%84.gif'),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), //角の丸み
            side: BorderSide(color: Colors.blueGrey), //枠線の設定
          ),
          color: Colors.blue,
          child: Text(
            "もう一度あそぶ",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ]),
    ));
  }
}
