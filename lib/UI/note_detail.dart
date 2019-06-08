import 'package:flutter/material.dart';


class note_detail extends StatefulWidget {
  String appBarTitle;
  note_detail(this.appBarTitle);
  @override
  _note_detailState createState() => _note_detailState(this.appBarTitle);
}

class _note_detailState extends State<note_detail> {

  var priorities=['high','low'];

  String appBarTitle;

  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();

  _note_detailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle txtstyle=Theme.of(context).textTheme.title;

    return WillPopScope(
      onWillPop: (){
        moveToLast();
      },
        child: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                moveToLast();
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: 15.0,
              left: 10.0,
              right: 10.0,
            ),
            child: ListView(
              children: <Widget>[
                ListTile(
                    title: DropdownButton(
                      items: priorities.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      style: txtstyle,
                      value: 'low',
                      onChanged: (valueselectedByUser) {
                        setState(() {
                          debugPrint('User selected $valueselectedByUser');
                        });
                      },
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.0,
                      bottom: 15.0
                  ),
                  child: TextField(
                    controller: titleController,
                    style: txtstyle,
                    onChanged: (value) {
                      debugPrint('Somthing changed in title Text Field');
                    },
                    decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: txtstyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                //Third Element
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.0,
                      bottom: 15.0
                  ),
                  child: TextField(
                    controller: descriptionController,
                    style: txtstyle,
                    onChanged: (value) {
                      debugPrint('Somthing changed description Text Field');
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: txtstyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),
                //Fourth Element
                Padding(
                  padding: EdgeInsets.only(
                    top: 15.0,
                    bottom: 15.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme
                              .of(context)
                              .primaryColorDark,
                          textColor: Theme
                              .of(context)
                              .primaryColorLight,
                          child: Text('Save', textScaleFactor: 1.5),
                          onPressed: () {
                            setState(() {
                              debugPrint('Save Button clicked');
                            });
                          },
                        ),
                      ),

                      Container(width: 5.0,),
                      //Second Button
                      Expanded(
                        child: RaisedButton(
                          color: Theme
                              .of(context)
                              .primaryColorDark,
                          textColor: Theme
                              .of(context)
                              .primaryColorLight,
                          child: Text('Delete', textScaleFactor: 1.5),
                          onPressed: () {
                            setState(() {
                              debugPrint('Delete Button clicked');
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),)
    );
  }
  void moveToLast(){
    Navigator.pop(context);
  }
}
