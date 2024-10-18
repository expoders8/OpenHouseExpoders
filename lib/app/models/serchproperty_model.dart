class GetAllSearchPropertyModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllSearchPropertyDataModel>? data;

  GetAllSearchPropertyModel({this.success, this.code, this.message, this.data});

  GetAllSearchPropertyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllSearchPropertyDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllSearchPropertyDataModel.fromJson(v));
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

class GetAllSearchPropertyDataModel {
  String? name;
  String? address1;

  GetAllSearchPropertyDataModel({this.name, this.address1});

  GetAllSearchPropertyDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address1 = json['address1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address1'] = address1;
    return data;
  }
}
