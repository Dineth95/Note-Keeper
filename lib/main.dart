import 'package:flutter/material.dart';
import 'package:note_keeper/UI/note_detail.dart';
import 'package:note_keeper/UI/notelist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Keeper'),

      ),

      body: notelist(),
      floatingActionButton: FloatingActionButton(
        //function for on pressed
        child: Icon(Icons.add),
        onPressed: (){
          debugPrint('FAB clicked');
          Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return note_detail('Add Note');
            }
          ));
        },
      ),
    );
  }
}




