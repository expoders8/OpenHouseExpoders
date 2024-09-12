class GetAllNotificationModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllNotificationDataModel>? data;

  GetAllNotificationModel({this.success, this.code, this.message, this.data});

  GetAllNotificationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllNotificationDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllNotificationDataModel.fromJson(v));
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

class GetAllNotificationDataModel {
  String? id;
  String? title;
  String? decription;
  bool? isActive;
  String? createdById;
  String? updatedById;
  String? createdOn;
  String? updatedOn;
  String? userid;

  GetAllNotificationDataModel(
      {this.id,
      this.title,
      this.decription,
      this.isActive,
      this.createdById,
      this.updatedById,
      this.createdOn,
      this.updatedOn,
      this.userid});

  GetAllNotificationDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    decription = json['decription'];
    isActive = json['is_active'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['decription'] = decription;
    data['is_active'] = isActive;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['userid'] = userid;
    return data;
  }
}
