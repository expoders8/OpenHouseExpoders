class GetAllCountryModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllCountryDataModel>? data;

  GetAllCountryModel({this.success, this.code, this.message, this.data});

  GetAllCountryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllCountryDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllCountryDataModel.fromJson(v));
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

class GetAllCountryDataModel {
  String? id;
  String? name;
  String? phoneCode;
  String? iso2;
  String? currency;
  String? createdOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;
  String? flag;

  GetAllCountryDataModel(
      {this.id,
      this.name,
      this.phoneCode,
      this.iso2,
      this.currency,
      this.createdOn,
      this.updatedOn,
      this.createdById,
      this.updatedById,
      this.flag});

  GetAllCountryDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneCode = json['phone_code'];
    iso2 = json['iso2'];
    currency = json['currency'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_Id'];
    updatedById = json['updated_by_Id'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone_code'] = phoneCode;
    data['iso2'] = iso2;
    data['currency'] = currency;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['created_by_Id'] = createdById;
    data['updated_by_Id'] = updatedById;
    data['flag'] = flag;
    return data;
  }
}
