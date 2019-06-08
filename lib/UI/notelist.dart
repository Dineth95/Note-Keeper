import 'package:flutter/material.dart';
import 'note_detail.dart';

class notelist extends StatefulWidget {
  @override
  _notelistState createState() => _notelistState();
}

class _notelistState extends State<notelist> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context,int position){
        return Card(
          color: Colors.white30,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text('Dummy title'),
            subtitle: Text('Dummy subtitle'),
            trailing: Icon(Icons.delete,color: Colors.grey,),
            onTap: (){
              debugPrint('Function for delete');
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return note_detail('Edit Note');
                }
              ));
            },
          ),
        );
      },
    );
  }
}
