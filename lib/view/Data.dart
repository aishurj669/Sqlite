import 'package:flutter/material.dart';
import 'file:///C:/Users/user1/AndroidStudioProjects/sqllite_app/lib/view/note_list.dart';

class Datapage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Data_Session();
  }

}

class Data_Session extends State<Datapage> {
  final titleController= TextEditingController();
  final descriptionController= TextEditingController();

  String dropdownValue = 'Low';

  String holder = '';

  List <String> actorsName = [
    'Low',
    'High',
  ];

  void getDropDownItem(){
    setState(() {
      holder = dropdownValue ;
    });
  }

  @override
  Widget build(BuildContext context) {

    //Size screenSize = MediaQuery.of(context).size;
   // Orientation orientation = MediaQuery.of(context).orientation;
    // TODO: implement build
   return Scaffold(
     resizeToAvoidBottomInset: false,
     appBar: AppBar(
       title: Text('Data'),
     ),
     body: SingleChildScrollView(
       child: Container(
             height: MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width ,
             child:Column(
               children: [
                 DropdownButton<String>(
                   value: dropdownValue,
                   icon: Icon(Icons.arrow_drop_down),
                   iconSize: 24,
                   elevation: 16,
                   style: TextStyle(color: Colors.black, fontSize: 18),
                   underline: Container(
                     height: 2,
                     color: Colors.blueAccent,
                   ),
                   onChanged: (String data) {
                     setState(() {
                       dropdownValue = data;
                   });
                 },
                  items: actorsName.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                   );
                  }).toList(),
                 ),
               ListTile(
                title: new TextField(
                  decoration: new InputDecoration(
                   border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                    hintText: "Title" ,
                    //'[MediaQuery width]: ${screenSize.width.toStringAsFixed(2)}\n' +
                       //'[MediaQuery orientation]: $orientation',
                    labelText: 'Title'),
                ),
               ),
               ListTile(
                 title: new TextField(
                   decoration: new InputDecoration(
                       border: new OutlineInputBorder(
                           borderSide: new BorderSide(color: Colors.teal)),
                         hintText: "Description",
                             //+   '[MediaQuery width]: ${screenSize.width.toStringAsFixed(2)}\n' +
                       // '[MediaQuery orientation]: $orientation',
                       labelText: 'Description'),
                   ),
                 ),
                Container(
                 // height: MediaQuery.of(context).size.height*0.2,
                  //width:MediaQuery.of(context).size.width ,
                 // padding: const EdgeInsets.all(10),
                  child:Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   Container(
                     //[MediaQuery width]: ${screenSize.width.toStringAsFixed(2)}\n\n +
                      //   [MediaQuery orientation]: $orientation,
                    child:
                     RaisedButton(
                      child: Text('Save'),
                      //+   '[MediaQuery width]: ${screenSize.width.toStringAsFixed(2)}\n\n' +
                         // '[MediaQuery orientation]: $orientation',),
                      color: Colors.blueAccent,
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>Notelist()),
                        );
                      }
                     ),
                   ),
                     Container(
                      //height: MediaQuery.of(context).size.height*0.2,
                      // width:MediaQuery.of(context).size.width*0.3 ,
                       padding: const EdgeInsets.all(20),
                      //child: Column(
                      // children:[
                       child:   RaisedButton(
                         child: Text('Cancel'),
                           //  +   '[MediaQuery width]: ${screenSize.width.toStringAsFixed(2)}\n\n' +
                            // '[MediaQuery orientation]: $orientation',),
                        color: Colors.blueAccent,
                        onPressed: (){}
                      ),
                    ),
                  ],
                ),
               ),
             ],
           ),
        ),
     ),
    );
  }

}