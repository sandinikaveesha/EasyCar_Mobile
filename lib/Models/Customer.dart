class Customer {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNo;
  int? userRef;
  String? img;

  Customer(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNo,
      this.userRef,
      this.img});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    userRef = json['userRef'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;
    data['userRef'] = this.userRef;
    data['img'] = this.img;
    return data;
  }
}
