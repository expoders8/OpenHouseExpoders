class GetAllPreviousTenantModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllPreviousTenantDataModel>? data;

  GetAllPreviousTenantModel({this.success, this.code, this.message, this.data});

  GetAllPreviousTenantModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllPreviousTenantDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllPreviousTenantDataModel.fromJson(v));
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

class GetAllPreviousTenantDataModel {
  String? id;
  String? tenantFirstName;
  String? tenantLastName;
  String? tenantEmail;
  String? tenantPhoneNumber;
  String? tenantProfilePicture;
  String? tenantStartDate;
  String? tenantEndDate;
  String? tenantType;

  GetAllPreviousTenantDataModel(
      {this.id,
      this.tenantFirstName,
      this.tenantLastName,
      this.tenantEmail,
      this.tenantPhoneNumber,
      this.tenantProfilePicture,
      this.tenantStartDate,
      this.tenantEndDate,
      this.tenantType});

  GetAllPreviousTenantDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantFirstName = json['tenant_first_name'];
    tenantLastName = json['tenant_last_name'];
    tenantEmail = json['tenant_email'];
    tenantPhoneNumber = json['tenant_phone_number'];
    tenantProfilePicture = json['tenant_profile_picture'];
    tenantStartDate = json['tenant_start_date'];
    tenantEndDate = json['tenant_end_date'];
    tenantType = json['tenant_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tenant_first_name'] = tenantFirstName;
    data['tenant_last_name'] = tenantLastName;
    data['tenant_email'] = tenantEmail;
    data['tenant_phone_number'] = tenantPhoneNumber;
    data['tenant_profile_picture'] = tenantProfilePicture;
    data['tenant_start_date'] = tenantStartDate;
    data['tenant_end_date'] = tenantEndDate;
    data['tenant_type'] = tenantType;
    return data;
  }
}
