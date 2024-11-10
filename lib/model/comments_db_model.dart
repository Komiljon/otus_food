class Comment {
  int? id;
  late String name;
  late String comment;

  Comment(this.id, this.comment, {this.name = 'Test'});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['comment'] = comment;
    return map;
  }

  Comment.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    comment = map['comment'];
  }
}
