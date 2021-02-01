import 'package:flutter/material.dart';

class Testwidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Testwidget_Session();
  }

}

class Testwidget_Session extends State<Testwidget>{

  //double myHeight = 0.0;
  //double myWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            'View\n\n' +
                '[MediaQuery width]: ${screenSize.width.toStringAsFixed(2)}\n\n' +
                '[MediaQuery orientation]: $orientation',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

}