import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'file:///C:/Users/user1/AndroidStudioProjects/sqllite_app/lib/view/Data.dart';
import 'package:sqllite_app/models/Note.dart';
import 'package:sqllite_app/models/NoteScreen.dart';
import 'package:sqllite_app/utils/database_helper.dart';

class Notelist extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return Note_Session();
  }

}

class Note_Session extends State<Notelist>{

  List<Note> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    db.getAllNotes().then((notes) {
      setState(() {
        notes.forEach((note) {
          items.add(Note.fromMap(note));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text('Notes'),
      ),
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
        child: ListView.builder(
          itemCount: items.length,
         // padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(),
                ListTile(
                 // leading: const Icon(Icons.edit_outlined),
                  title: Text(
                    '${items[position].name}',
                     style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    '${items[position].age}',
                     style: new TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  leading: Column(
                    children: <Widget>[
                      IconButton(icon:const Icon(Icons.edit_outlined), onPressed: () =>
                          navigateToNote(context, items[position]),
                      ),

                    ],
                  ),
                  trailing:IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          deleteNote(context, items[position], position)),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _createNewNote(context),
      ),
    );
  }
  void deleteNote(BuildContext context, Note note, int position) async {
     db.deleteNote(note.id).then((notes) {
       setState(() {
         items.removeAt(position);
       });
     });
   }

  void navigateToNote(BuildContext context, Note note) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Notescreen(note)),
    );

    if (result == 'update') {
      db.getAllNotes().then((notes) {
        setState(() {
          items.clear();
          notes.forEach((note) {
            items.add(Note.fromMap(note));
          });
        });
      });
    }
  }

  void _createNewNote(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  Notescreen(Note('', ''))),
    );

    if (result == 'save') {
      db.getAllNotes().then((notes) {
        setState(() {
          items.clear();
          notes.forEach((note) {
            items.add(Note.fromMap(note));
          });
        });
      });
    }
  }

}


