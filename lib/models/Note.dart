class Note {
  int id;
  String _name;
  String _age;

  Note(this._name, this._age);

  Note.map(dynamic obj) {
    this.id = obj['id'];
    this._name = obj['name'];
    this._age = obj['age'];
  }

  int get colId => id;
  String get name => _name;
  String get age => _age;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = _name;
    map['age'] = _age;
    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this._name = map['name'];
    this._age = map['age'];
  }
}