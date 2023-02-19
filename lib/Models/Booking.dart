class Booking {
  int? id;
  String? startDate;
  String? endDate;
  String? status;
  int? paymentRef;
  int? userRef;
  int? vehicleRef;
  int? agencyRef;
  int? driverRef;

  Booking(
      {this.id,
      this.startDate,
      this.endDate,
      this.status,
      this.paymentRef,
      this.userRef,
      this.vehicleRef,
      this.agencyRef,
      this.driverRef});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
    paymentRef = json['paymentRef'];
    userRef = json['userRef'];
    vehicleRef = json['vehicleRef'];
    agencyRef = json['agencyRef'];
    driverRef = json['driverRef'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['status'] = this.status;
    data['paymentRef'] = this.paymentRef;
    data['userRef'] = this.userRef;
    data['vehicleRef'] = this.vehicleRef;
    data['agencyRef'] = this.agencyRef;
    data['driverRef'] = this.driverRef;
    return data;
  }
}
