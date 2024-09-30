class GetAllExpenseModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllExpenseDataModel>? data;

  GetAllExpenseModel({this.success, this.code, this.message, this.data});

  GetAllExpenseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllExpenseDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllExpenseDataModel.fromJson(v));
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

class GetAllExpenseDataModel {
  String? id;
  String? amenityId;
  String? price;
  String? propertyId;
  bool? isActive;
  String? createdOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;
  String? amenityname;

  GetAllExpenseDataModel({
    this.id,
    this.amenityId,
    this.price,
    this.propertyId,
    this.isActive,
    this.createdOn,
    this.updatedOn,
    this.createdById,
    this.updatedById,
    this.amenityname,
  });

  GetAllExpenseDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amenityId = json['amenity_id'];
    price = json['price'];
    propertyId = json['property_id'];
    isActive = json['is_active'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    amenityname = json['amenity_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amenity_id'] = amenityId;
    data['price'] = price;
    data['property_id'] = propertyId;
    data['is_active'] = isActive;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    data['amenity_name'] = amenityname;
    return data;
  }
}
