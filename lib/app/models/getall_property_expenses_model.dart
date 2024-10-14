class GetallPropertyExpensesModel {
  bool? success;
  int? code;
  String? message;
  List<GetallPropertyExpensesDataModel>? data;

  GetallPropertyExpensesModel(
      {this.success, this.code, this.message, this.data});

  GetallPropertyExpensesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetallPropertyExpensesDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetallPropertyExpensesDataModel.fromJson(v));
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

class GetallPropertyExpensesDataModel {
  String? propertyid;
  String? propertyName;
  String? propertyAddress;
  String? propertyDescription;
  String? propertyImage;
  List<Rentals>? rentals;

  GetallPropertyExpensesDataModel(
      {this.propertyid,
      this.propertyName,
      this.propertyAddress,
      this.propertyDescription,
      this.propertyImage,
      this.rentals});

  GetallPropertyExpensesDataModel.fromJson(Map<String, dynamic> json) {
    propertyName = json['property_name'];
    propertyid = json['property_id'];
    propertyAddress = json['property_address'];
    propertyDescription = json['property_description'];
    propertyImage = json['property_image'];
    if (json['rentals'] != null) {
      rentals = <Rentals>[];
      json['rentals'].forEach((v) {
        rentals!.add(Rentals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['property_name'] = propertyName;
    data['property_id'] = propertyid;
    data['property_address'] = propertyAddress;
    data['property_description'] = propertyDescription;
    data['property_image'] = propertyImage;
    if (rentals != null) {
      data['rentals'] = rentals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rentals {
  String? price;
  String? title;

  Rentals({this.price, this.title});

  Rentals.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['title'] = title;
    return data;
  }
}
