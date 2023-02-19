class Vehicle {
  int? id;
  String? registrationNo;
  int? category;
  String? fuelType;
  String? engineCapacity;
  int? brand;
  String? color;
  double? pricePerDay;
  double? extraCharge;
  String? status;
  String? model;
  String? modelYear;
  int? agencyRef;
  int? vehicleOwnerRef;
  String? description;
  String? gear;

  Vehicle(
      {this.id,
      this.registrationNo,
      this.category,
      this.fuelType,
      this.engineCapacity,
      this.brand,
      this.color,
      this.pricePerDay,
      this.extraCharge,
      this.status,
      this.model,
      this.modelYear,
      this.agencyRef,
      this.vehicleOwnerRef,
      this.description,
      this.gear});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    registrationNo = json['registrationNo'];
    category = json['category'];
    fuelType = json['fuelType'];
    engineCapacity = json['engineCapacity'];
    brand = json['brand'];
    color = json['color'];
    pricePerDay = json['pricePerDay'];
    extraCharge = json['extraCharge'];
    status = json['status'];
    model = json['model'];
    modelYear = json['modelYear'];
    agencyRef = json['agencyRef'];
    vehicleOwnerRef = json['vehicleOwnerRef'];
    description = json['description'];
    gear = json['gear'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['registrationNo'] = this.registrationNo;
    data['category'] = this.category;
    data['fuelType'] = this.fuelType;
    data['engineCapacity'] = this.engineCapacity;
    data['brand'] = this.brand;
    data['color'] = this.color;
    data['pricePerDay'] = this.pricePerDay;
    data['extraCharge'] = this.extraCharge;
    data['status'] = this.status;
    data['model'] = this.model;
    data['modelYear'] = this.modelYear;
    data['agencyRef'] = this.agencyRef;
    data['vehicleOwnerRef'] = this.vehicleOwnerRef;
    data['description'] = this.description;
    data['gear'] = this.gear;
    return data;
  }
}
