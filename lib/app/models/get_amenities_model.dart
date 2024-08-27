class GetAllAmenitiesModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllAmenitiesDataModel>? data;

  GetAllAmenitiesModel({this.success, this.code, this.message, this.data});

  GetAllAmenitiesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllAmenitiesDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllAmenitiesDataModel.fromJson(v));
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

class GetAllAmenitiesDataModel {
  String? id;
  String? title;
  String? type;
  String? icon;
  String? createdOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;
  bool? isActive;

  GetAllAmenitiesDataModel(
      {this.id,
      this.title,
      this.type,
      this.icon,
      this.createdOn,
      this.updatedOn,
      this.createdById,
      this.updatedById,
      this.isActive});

  GetAllAmenitiesDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    icon = json['icon'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
    createdById = json['createdById'];
    updatedById = json['updatedById'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['icon'] = icon;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    data['createdById'] = createdById;
    data['updatedById'] = updatedById;
    data['isActive'] = isActive;
    return data;
  }
}
