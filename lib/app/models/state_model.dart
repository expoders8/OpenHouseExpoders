class GetAllStateModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllStateDataModel>? data;

  GetAllStateModel({this.success, this.code, this.message, this.data});

  GetAllStateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllStateDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllStateDataModel.fromJson(v));
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

class GetAllStateDataModel {
  String? id;
  String? name;
  String? countryId;
  String? createdOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;

  GetAllStateDataModel(
      {this.id,
      this.name,
      this.countryId,
      this.createdOn,
      this.updatedOn,
      this.createdById,
      this.updatedById});

  GetAllStateDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    return data;
  }
}
