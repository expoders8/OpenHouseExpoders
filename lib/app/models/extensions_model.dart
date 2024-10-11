class GetAllExtensionModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllExtensionDataModel>? data;

  GetAllExtensionModel({this.success, this.code, this.message, this.data});

  GetAllExtensionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllExtensionDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllExtensionDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllExtensionDataModel {
  String? propertyId;
  String? propertyName;
  String? propertyAddress;
  String? rentalCount;
  String? latestRentalDate;
  List<Rentals>? rentals;

  GetAllExtensionDataModel(
      {this.propertyId,
      this.propertyName,
      this.propertyAddress,
      this.rentalCount,
      this.latestRentalDate,
      this.rentals});

  GetAllExtensionDataModel.fromJson(Map<String, dynamic> json) {
    propertyId = json['property_id'];
    propertyName = json['property_name'];
    propertyAddress = json['property_address'];
    rentalCount = json['rental_count'];
    latestRentalDate = json['latest_rental_date'];
    if (json['rentals'] != null) {
      rentals = <Rentals>[];
      json['rentals'].forEach((v) {
        rentals!.add(Rentals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['property_id'] = propertyId;
    data['property_name'] = propertyName;
    data['property_address'] = propertyAddress;
    data['rental_count'] = rentalCount;
    data['latest_rental_date'] = latestRentalDate;
    if (rentals != null) {
      data['rentals'] = rentals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rentals {
  String? startDate;
  String? endDate;
  String? cretedOn;
  String? tenantName;
  String? profilePicture;
  String? rentAmount;

  Rentals(
      {this.startDate,
      this.endDate,
      this.cretedOn,
      this.tenantName,
      this.profilePicture,
      this.rentAmount});

  Rentals.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
    cretedOn = json['creted_on'];
    tenantName = json['tenant_name'];
    profilePicture = json['profile_picture'];
    rentAmount = json['rent_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['creted_on'] = cretedOn;
    data['tenant_name'] = tenantName;
    data['profile_picture'] = profilePicture;
    data['rent_amount'] = rentAmount;
    return data;
  }
}
