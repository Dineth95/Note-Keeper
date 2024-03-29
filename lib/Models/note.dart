class note{
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  note(this._title,this._date, this._priority,[this._description]);

  note.withid(this._id,this._title,this._date,this._priority,[this._description]);

  int get priority => _priority;

  String get date => _date;

  String get description => _description;

  String get title => _title;

  int get id => _id;

  set title(String newTitle){
    if(newTitle.length<=5){
      this._title=newTitle;
    }
  }

  set description(String newDescription){
    if(newDescription.length<=5){
      this._description=newDescription;
    }
  }

  set priority(int newPriority){
    if(newPriority>=1 && newPriority<=2){
      this._priority=newPriority;
    }
  }

  set date(String newDate){
    this._date=newDate;
  }
  //Map note Object to save data
  Map<String,dynamic> toMap(){

    var map=Map<String,dynamic>();

    if(id!=null){
      map['id']=_id;
    }
    map['description']=_description;
    map['priority']=_priority;
    map['date']=_date;

    return map;
  }

  //Get note object from the map object
  //Purpose is to retrive data
  note.fromMapObject(Map<String,dynamic> map){
    this._id=map['id'];
    this._title=map['title'];
    this._description=map['description'];
    this._priority=map['priority'];
    this._date=map['date'];
  }
}