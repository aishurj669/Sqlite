import 'package:flutter/material.dart';
import 'package:sqllite_app/models/Note.dart';
import 'package:sqllite_app/utils/database_helper.dart';

class Notescreen extends StatefulWidget{
 final Note _note;
 Notescreen(this._note);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return NoteScreenState();
  }

}

class NoteScreenState extends State<Notescreen>{

  DatabaseHelper db = new DatabaseHelper();

  TextEditingController nameController;
  TextEditingController ageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController = new TextEditingController(text: widget._note.name);
    ageController = new TextEditingController(text: widget._note.age);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     resizeToAvoidBottomInset: false,
     appBar: AppBar(title: Text('Note')),
     body: Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(
             begin: Alignment.topRight,
             end: Alignment.bottomLeft,
             stops: [0.7,0.7,0.7,1],
             colors: [
               Color(0XFFBBDEFB), Color(0XFFE3F2FD),Colors.blueAccent,
               Colors.white,
             ]),),
       //margin: EdgeInsets.all(15.0),
       //alignment: Alignment.center,
       child: Column(
         children: <Widget>[
           TextField(
             controller: nameController,
             decoration: InputDecoration(labelText: 'name'),
           ),
          // Padding(padding: new EdgeInsets.all(5.0)),
           TextField(
             controller: ageController,
             decoration: InputDecoration(labelText: 'age'),
           ),
           //Padding(padding: new EdgeInsets.all(5.0)),
           RaisedButton(
             child: (widget._note.id != null) ? Text('Update') : Text('Add'),
             onPressed: () {
               if (widget._note.id != null) {
                 db.updateNote(Note.fromMap({
                   'id': widget._note.id,
                   'name': nameController.text,
                   'age': ageController.text
                 })).then((_) {
                   Navigator.pop(context, 'update');
                 });
               }else {
                 db.saveNote(Note(nameController.text, ageController.text)).then((_) {
                   Navigator.pop(context, 'save');
                 });
               }
             },
           ),
         ],
       ),
     ),
   );
  }
}

