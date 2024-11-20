class Comment {
  int? id;
  int? cid;
  late String name;
  late String comment;

  Comment(this.id, this.cid, this.comment, {this.name = 'Test'});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['commentid'] = cid??0;
    map['name'] = name;
    map['comment'] = comment;
    return map;
  }

  Comment.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    cid =  map['commentid'];
    name = map['name'];
    comment = map['comment'];
  }
}
