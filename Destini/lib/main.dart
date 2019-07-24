import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'story_brain.dart';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
  );


  void check()
  {
    setState(() {
      int s = storyBrain.getStoryNum();
      if(s == 3) {
        Alert(

          context: context,
          style: alertStyle,
          title: "......",
          desc: "Good job",
          image: Image.asset("images/hp.gif"),
        ).show();
        storyBrain.restart();
      }
      else
        {
          if(s== 4 || s == 5)
            {
              Alert(
                context: context,
                style: alertStyle,
                title: "DEAD",
                desc: "Your Not........",
                image: Image.asset("images/dead.gif"),
              ).show();
              storyBrain.restart();

            }
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    setState(() {
                      storyBrain.nextStory(1);
                      check();
                    });

                  },
                  color: Colors.red,
                  child: Text(

                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                  child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      setState(() {
                        storyBrain.nextStory(2);
                        check();
                      });
                       },
                    color: Colors.blue,
                    child: Text(

                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


