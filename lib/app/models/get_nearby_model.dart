class GetAllNearByModel {
  bool? success;
  int? code;
  List<GetAllNearByDataModel>? data;

  GetAllNearByModel({this.success, this.code, this.data});

  GetAllNearByModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    if (json['data'] != null) {
      data = <GetAllNearByDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllNearByDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllNearByDataModel {
  String? id;
  String? title;
  String? description;
  String? address;
  bool? isActive;
  String? createdOn;
  String? updatedOn;
  String? createdById;
  String? propertyId;

  GetAllNearByDataModel(
      {this.id,
      this.title,
      this.description,
      this.address,
      this.isActive,
      this.createdOn,
      this.updatedOn,
      this.createdById,
      this.propertyId});

  GetAllNearByDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    address = json['address'];
    isActive = json['is_active'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
    propertyId = json['property_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['address'] = address;
    data['is_active'] = isActive;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['created_by_id'] = createdById;
    data['property_id'] = propertyId;
    return data;
  }
}
