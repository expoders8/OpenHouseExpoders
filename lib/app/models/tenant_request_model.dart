class GetAllHostRequestsModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllHostRequestsDataModel>? data;

  GetAllHostRequestsModel({this.success, this.code, this.message, this.data});

  GetAllHostRequestsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllHostRequestsDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllHostRequestsDataModel.fromJson(v));
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

class GetAllHostRequestsDataModel {
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
  String? status;
  String? hostUserId;
  String? username;
  String? address;
  String? title;

  GetAllHostRequestsDataModel(
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
      this.status,
      this.hostUserId,
      this.username,
      this.address,
      this.title});

  GetAllHostRequestsDataModel.fromJson(Map<String, dynamic> json) {
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
    status = json['status'];
    hostUserId = json['host_user_id'];
    username = json['username'];
    address = json['address'];
    title = json['title'];
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
    data['status'] = status;
    data['host_user_id'] = hostUserId;
    data['username'] = username;
    data['address'] = address;
    data['title'] = title;
    return data;
  }
}
