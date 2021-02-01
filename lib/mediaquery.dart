import 'package:flutter/material.dart';

class mediaquery extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return mediaquery_Session();
  }

}


class mediaquery_Session extends State<mediaquery>{



  Widget _portraitMode() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Portrait Mode",
              style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30,),
            new Image.asset(
              'assets/devs.jpg',
              height: 200,
              width: 200,
            ),
          ],
        ),
      ],
    );
  }

    Widget _landscapeMode(){
      return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Landscape Mode",
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30,),
              new Image.asset('assets/powered_by.png',
                height: 50.0,
                fit: BoxFit.cover,
              )

            ],
          ),
        ],
      );
    }
  //
  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
  //
  // }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Orientation In Flutter"),
        centerTitle: true,
      ),
      body: OrientationBuilder(
        builder: (context, orientation){
          if(orientation == Orientation.portrait){
            return _portraitMode();
          }else{
            return _landscapeMode();
          }
        },
      ),
    );


  }

}