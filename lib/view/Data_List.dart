import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqllite_app/utils/database_helper.dart';
import 'package:sqllite_app/view/note_list.dart';


class Data_List extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DataList_Session();
  }

}

class DataList_Session extends State<Data_List>{

  final nameController= TextEditingController();
  final ageController = TextEditingController();

 // final databaseHelper=DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     //resizeToAvoidBottomInset: false,
     appBar: AppBar(
        title: Text('SQlite'),
     ),
     body: Center(
       child: Column(
         children: [
           TextField(
             controller: nameController,
             decoration: InputDecoration(
              hintText: "Name",
             ),
           ),

           TextField(
             controller: ageController,
             decoration: InputDecoration(
               hintText: "Age",
             ),
           ),

           RaisedButton(
               child: Text('Insert'),
               onPressed: () {

               }
               ),
           RaisedButton(
               child: Text('Getdata'),
               onPressed: () {

               }
           ),
           RaisedButton(
               child: Text('Update'),
               onPressed: () {

                 Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => Notelist()),
                 );
               }
           ),
           RaisedButton(
               child: Text('Delete'),
               onPressed: () {

               }
           ),
         ],
       ),
     ),
   );
  }

  // void insert() async{
  //   Map<String, dynamic> row ={
  //     Database_helper.colName : nameController.text,
  //     Database_helper.colAge: ageController.text,
  //   };
  //   final id = await databaseHelper.insertNote(row);
  //   print('inserted row id : $id');
  // }
  //
  // void getdata() async{
  //   final allRows = await databaseHelper.queryAllrows();
  //   print('Query all Rows:');
  //   allRows.forEach((row) => print(row));
  // }
  //
  // void update() async{
  //   Map<String, dynamic> row ={
  //     Database_helper.colId: 1,
  //    Database_helper.colName : "dd",
  //     Database_helper.colAge: 24,
  //   };
  //   final rowsAffected = await databaseHelper.updateNote(row);
  //   print('updated $rowsAffected row(s)');
  // }
  //
  // void delete() async {
  //   // Assuming that the number of rows is the id for the last row.
  //   final id = await databaseHelper.queryRowcount();
  //   final rowsDeleted = await databaseHelper.deleteNote(id);
  //   print('deleted $rowsDeleted row(s): row $id');
  }
