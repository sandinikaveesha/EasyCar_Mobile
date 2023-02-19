class Category {
  int? id;
  String? title;
  String? code;
  String? description;

  Category({this.id, this.title, this.code, this.description});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}
