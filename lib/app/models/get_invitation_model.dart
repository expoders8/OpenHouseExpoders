class GetAllInvitationModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllInvitationDataModel>? data;

  GetAllInvitationModel({this.success, this.code, this.message, this.data});

  GetAllInvitationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllInvitationDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllInvitationDataModel.fromJson(v));
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

class GetAllInvitationDataModel {
  String? id;
  String? email;
  String? phoneNumber;
  String? status;
  String? hostUserId;
  String? propertyId;
  String? rentAmount;
  String? rentAmountUnit;
  String? createdOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;
  bool? isActive;
  String? startDate;
  String? endDate;
  String? tenantId;
  String? firstName;
  String? lastName;
  String? address;

  GetAllInvitationDataModel(
      {this.id,
      this.email,
      this.phoneNumber,
      this.status,
      this.hostUserId,
      this.propertyId,
      this.rentAmount,
      this.rentAmountUnit,
      this.createdOn,
      this.updatedOn,
      this.createdById,
      this.updatedById,
      this.isActive,
      this.startDate,
      this.endDate,
      this.tenantId,
      this.firstName,
      this.lastName,
      this.address});

  GetAllInvitationDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    status = json['status'];
    hostUserId = json['host_user_id'];
    propertyId = json['property_id'];
    rentAmount = json['rent_amount'];
    rentAmountUnit = json['rent_amount_unit'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    isActive = json['is_active'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    tenantId = json['tenant_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['status'] = status;
    data['host_user_id'] = hostUserId;
    data['property_id'] = propertyId;
    data['rent_amount'] = rentAmount;
    data['rent_amount_unit'] = rentAmountUnit;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    data['is_active'] = isActive;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['tenant_id'] = tenantId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['address'] = address;
    return data;
  }
}
