class VehicleImage {
  int? id;
  String? img;
  int? vehicle;

  VehicleImage({this.id, this.img, this.vehicle});

  VehicleImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    vehicle = json['vehicle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['vehicle'] = this.vehicle;
    return data;
  }
}
