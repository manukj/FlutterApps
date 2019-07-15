import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int leftdice = 4;
  int rightdice = 1;

  void change_dice() {
    setState(() {
      leftdice = Random().nextInt(6) + 1;
      rightdice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Center(
            child: Text("Dice"),
          )),
      body: Container(
        child: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      change_dice();
                    },
                    child: Image.asset("images/dice$leftdice.png")),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      change_dice();
                    },
                    child: Image.asset("images/dice$rightdice.png")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
