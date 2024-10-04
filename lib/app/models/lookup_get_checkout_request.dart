class GetAllCheckoutRequestLookupModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllCheckoutRequestLookupDataModel>? data;

  GetAllCheckoutRequestLookupModel(
      {this.success, this.code, this.message, this.data});

  GetAllCheckoutRequestLookupModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllCheckoutRequestLookupDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllCheckoutRequestLookupDataModel.fromJson(v));
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

class GetAllCheckoutRequestLookupDataModel {
  String? id;
  String? name;
  String? description;
  String? icon;
  bool? isActive;
  String? createdOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;

  GetAllCheckoutRequestLookupDataModel(
      {this.id,
      this.name,
      this.description,
      this.icon,
      this.isActive,
      this.createdOn,
      this.updatedOn,
      this.createdById,
      this.updatedById});

  GetAllCheckoutRequestLookupDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    icon = json['icon'];
    isActive = json['is_active'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['icon'] = icon;
    data['is_active'] = isActive;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    return data;
  }
}
