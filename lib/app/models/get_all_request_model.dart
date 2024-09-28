class GetAllRequestsModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllRequestsDataModel>? data;

  GetAllRequestsModel({this.success, this.code, this.message, this.data});

  GetAllRequestsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllRequestsDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllRequestsDataModel.fromJson(v));
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

class GetAllRequestsDataModel {
  String? id;
  String? description;
  String? type;
  String? startDate;
  String? createdById;
  String? updatedById;
  String? createdOn;
  String? updatedOn;
  bool? isActive;
  String? amenityId;
  String? userId;
  String? propertyId;
  String? title;
  String? status;
  String? address;
  String? username;
  String? amenityTitle;

  GetAllRequestsDataModel(
      {this.id,
      this.description,
      this.type,
      this.startDate,
      this.createdById,
      this.updatedById,
      this.createdOn,
      this.updatedOn,
      this.isActive,
      this.amenityId,
      this.userId,
      this.propertyId,
      this.title,
      this.status,
      this.address,
      this.username,
      this.amenityTitle});

  GetAllRequestsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    type = json['type'];
    startDate = json['start_date'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    isActive = json['is_active'];
    amenityId = json['amenity_id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    title = json['title'];
    status = json['status'];
    address = json['address'];
    username = json['username'];
    amenityTitle = json['amenity_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['type'] = type;
    data['start_date'] = startDate;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['is_active'] = isActive;
    data['amenity_id'] = amenityId;
    data['user_id'] = userId;
    data['property_id'] = propertyId;
    data['title'] = title;
    data['status'] = status;
    data['address'] = address;
    data['username'] = username;
    data['amenity_title'] = amenityTitle;
    return data;
  }
}
