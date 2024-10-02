class GetAllHousekeeperModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllHousekeeperDataModel>? data;

  GetAllHousekeeperModel({this.success, this.code, this.message, this.data});

  GetAllHousekeeperModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllHousekeeperDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllHousekeeperDataModel.fromJson(v));
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

class GetAllHousekeeperDataModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  bool? isActive;
  String? createdOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;
  String? propertyId;

  GetAllHousekeeperDataModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.isActive,
      this.createdOn,
      this.updatedOn,
      this.createdById,
      this.updatedById,
      this.propertyId});

  GetAllHousekeeperDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    isActive = json['is_active'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    propertyId = json['property_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['is_active'] = isActive;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    data['property_id'] = propertyId;
    return data;
  }
}
