class Agency {
  int? id;
  String? businessName;
  String? email;
  String? phoneNo;
  String? address;
  double? lon;
  double? lat;
  String? status;
  String? brno;

  Agency(
      {this.id,
      this.businessName,
      this.email,
      this.phoneNo,
      this.address,
      this.lon,
      this.lat,
      this.status,
      this.brno});

  Agency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessName = json['businessName'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    address = json['address'];
    lon = json['lon'];
    lat = json['lat'];
    status = json['status'];
    brno = json['brno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['businessName'] = this.businessName;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;
    data['address'] = this.address;
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    data['status'] = this.status;
    data['brno'] = this.brno;
    return data;
  }
}
