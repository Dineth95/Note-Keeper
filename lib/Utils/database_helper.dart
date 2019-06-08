import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:note_keeper/Models/note.dart';

class database_helper{
  static database_helper databaseHelper;
  //Singleton databaseHelper

  static Database database;
  //Singleton Database

  String noteTable='note_table';
  String colId='id';
  String colTitle='title';
  String colDescription='description';
  String colPriority='priority';
  String colDate='date';

  database_helper._createInstance();

  factory database_helper(){
    if(databaseHelper==null){
      databaseHelper=database_helper._createInstance();
    }
    return databaseHelper;
  }

  //initialize database
  Future<Database> initializeDatabase() async{
    //Get the directory path for android(Or Ios)
    Directory directory=await getApplicationDocumentsDirectory();
    //getApplicationDocumentsDirectory() returns the  future object
    String path=directory.path + 'notes.db';

    //Open or Create the database at given path
    var notesDatabase=openDatabase(path,version: 1,onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db,int newVersion) async{
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOiNCREMENT,$colTitle TEXT,'
        '$colDescription TEXT,$colPriority INTEGER,$colDate TEXT)');
  }
}