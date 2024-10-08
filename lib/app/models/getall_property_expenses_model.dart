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
  String? id;
  String? name;
  String? description;
  String? address;
  bool? isActive;
  String? createdOn;
  String? updatedOn;
  String? price;
  String? title;
  String? propertyImage;

  GetallPropertyExpensesDataModel(
      {this.id,
      this.name,
      this.description,
      this.address,
      this.isActive,
      this.createdOn,
      this.updatedOn,
      this.price,
      this.title,
      this.propertyImage});

  GetallPropertyExpensesDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    isActive = json['is_active'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    price = json['price'];
    title = json['title'];
    propertyImage = json['property_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['address'] = address;
    data['is_active'] = isActive;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['price'] = price;
    data['title'] = title;
    data['property_image'] = propertyImage;
    return data;
  }
}
