class GetAllCheckoutModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllCheckoutDataModel>? data;

  GetAllCheckoutModel({this.success, this.code, this.message, this.data});

  GetAllCheckoutModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllCheckoutDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllCheckoutDataModel.fromJson(v));
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

class GetAllCheckoutDataModel {
  String? id;
  String? propertyId;
  String? tenantUserId;
  String? rentAmount;
  String? startDate;
  String? endDate;
  String? status;
  String? cretedOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;
  bool? isActive;
  String? hostUserId;
  bool? checkoutRequested;
  List? checkoutChecklist;
  String? checkoutRequestedOn;
  String? username;
  String? phonenumber;
  String? address;
  String? profilePicture;

  GetAllCheckoutDataModel(
      {this.id,
      this.propertyId,
      this.tenantUserId,
      this.rentAmount,
      this.startDate,
      this.endDate,
      this.status,
      this.cretedOn,
      this.updatedOn,
      this.createdById,
      this.updatedById,
      this.isActive,
      this.hostUserId,
      this.checkoutRequested,
      this.checkoutChecklist,
      this.checkoutRequestedOn,
      this.username,
      this.phonenumber,
      this.address,
      this.profilePicture});

  GetAllCheckoutDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    tenantUserId = json['tenant_user_id'];
    rentAmount = json['rent_amount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    cretedOn = json['creted_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    isActive = json['is_active'];
    hostUserId = json['host_user_id'];
    checkoutRequested = json['checkout_requested'];
    checkoutChecklist = json['checkout_checklist'];
    checkoutRequestedOn = json['checkout_requested_on'];
    username = json['username'];
    phonenumber = json['phone_number'];
    profilePicture = json['profile_picture'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['tenant_user_id'] = tenantUserId;
    data['rent_amount'] = rentAmount;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    data['creted_on'] = cretedOn;
    data['updated_on'] = updatedOn;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    data['is_active'] = isActive;
    data['host_user_id'] = hostUserId;
    data['checkout_requested'] = checkoutRequested;
    data['checkout_checklist'] = checkoutChecklist;
    data['checkout_requested_on'] = checkoutRequestedOn;
    data['username'] = username;
    data['phone_number'] = phonenumber;
    data['profile_picture'] = profilePicture;
    data['address'] = address;
    return data;
  }
}
