import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("Images/1st.png"),
                ),
                Text(
                  "Manu KJ",
                  style: TextStyle(fontSize: 30, fontFamily: "Intro"),
                ),
                Text(
                  "Passioante Developer",
                  style: TextStyle(
                      fontSize: 20, fontFamily: "Name", letterSpacing: 1),
                ),
                SizedBox(
                  height: 10,
                  width: 150,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                  child:
                      ListTile(title: Text("manu1998kj@gmail.com"), leading: Icon(Icons.mail)),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                    child: ListTile(
                  title: Text("9379627978"),
                  leading: Icon(Icons.phone),
                ))
              ],
            ),
          ),
        ));
  }
}
