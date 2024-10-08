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
  String? propertyName;
  String? propertyAddress;
  String? propertyDescription;
  String? propertyImage;
  List<ResultExpenses>? resultExpenses;

  GetallPropertyExpensesDataModel(
      {this.propertyName,
      this.propertyAddress,
      this.propertyDescription,
      this.propertyImage,
      this.resultExpenses});

  GetallPropertyExpensesDataModel.fromJson(Map<String, dynamic> json) {
    propertyName = json['property_name'];
    propertyAddress = json['property_address'];
    propertyDescription = json['property_description'];
    propertyImage = json['property_image'];
    if (json['resultExpenses'] != null) {
      resultExpenses = <ResultExpenses>[];
      json['resultExpenses'].forEach((v) {
        resultExpenses!.add(ResultExpenses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['property_name'] = propertyName;
    data['property_address'] = propertyAddress;
    data['property_description'] = propertyDescription;
    data['property_image'] = propertyImage;
    if (resultExpenses != null) {
      data['resultExpenses'] = resultExpenses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultExpenses {
  String? id;
  String? amenityId;
  String? price;
  String? propertyId;
  String? createdOn;
  String? updatedOn;
  String? title;

  ResultExpenses(
      {this.id,
      this.amenityId,
      this.price,
      this.propertyId,
      this.createdOn,
      this.updatedOn,
      this.title});

  ResultExpenses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amenityId = json['amenity_id'];
    price = json['price'];
    propertyId = json['property_id'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amenity_id'] = amenityId;
    data['price'] = price;
    data['property_id'] = propertyId;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['title'] = title;
    return data;
  }
}
